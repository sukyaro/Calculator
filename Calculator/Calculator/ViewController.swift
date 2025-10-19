//
//  ViewController.swift
//  Calculator
//
//  Created by Yaroslav Lebedynskyi on 18/10/2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ViewLabel: UILabel!
    
    var currentOperator: String?
    var firstNumber: Double?
    var secondNumber: Double?
    
    
    @IBAction func pressedNumber(_ sender: UIButton) {
        let number = sender.titleLabel?.text ?? ""
        ViewLabel.text = (ViewLabel.text ?? "") + number
    }
    
    @IBAction func pressedOperator(_ sender: UIButton) {
        currentOperator = sender.titleLabel?.text
        firstNumber = Double(ViewLabel.text!)
        ViewLabel.text = ""
    }
    
    @IBAction func pressedEqual(_ sender: UIButton) {
        secondNumber = Double(ViewLabel.text!)
        if let operation = currentOperator,
           let first = firstNumber,
           let second = secondNumber {
            
            var checkNumber : Double = 0
            
            switch operation {
            case "+" : checkNumber = first + second
            case "-" : checkNumber = first - second
            case "X" : checkNumber = first * second
            case "÷" : checkNumber = first / second
            default : break
            }
            
            if checkNumber.truncatingRemainder(dividingBy: 1) == 0 {
                ViewLabel.text = "\(Int(checkNumber))"
            }
            else {
                ViewLabel.text = "\(checkNumber)"
            }
        }
    }
    
    @IBAction func pressedPercentage(_ sender: UIButton) {
        if let number = Double(ViewLabel.text!) {
            let result = number / 100
            ViewLabel.text = "\(result)"
        }
    }
    
    @IBAction func pressedSign(_ sender: UIButton) {
        if let number = Double(ViewLabel.text!) {
            ViewLabel.text = "\(number * -1)"
        }
    }
    
    @IBAction func pressedAC(_ sender: UIButton) {
        firstNumber = 0
        secondNumber = 0
        currentOperator = ""
        ViewLabel.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

