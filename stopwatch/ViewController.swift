//
//  ViewController.swift
//  stopwatch
//
//  Created by 中井日向子 on 2022/08/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var result:UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        result.text = ""
    }
    
    @objc func up(){
        count += 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei(){
        if(count>=9.80 && count<=10.20){
            result.text = "すごい!"
        }else if(count>=9.70 && count<=10.30){
            result.text = "いいね"
        }else if (count>=9.50 && count<=10.50){
            result.text = "もう少し頑張ろう"
        }else{
            result.text = "もう一回挑戦しよう"
        }
    }
    
    @IBAction func start(){
        if(!timer.isValid){
            result.text = ""
            //もしtimerがfalseなら
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
    
    @IBAction func stop(){
        if (timer.isValid){
            timer.invalidate()
            
            self.hantei()
        }
    }
    
    @IBAction func reset(){
        if(timer.isValid){
            timer.invalidate()
        }else{
            count = 0.0
            label.text = String(format: "%.2f", count)
            result.text = ""
        }
        
    }


}
