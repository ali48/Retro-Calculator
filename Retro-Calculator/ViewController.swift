//
//  ViewController.swift
//  Retro-Calculator
//
//  Created by Muhammad Ali on 2016-02-19.
//  Copyright © 2016 Muhammad Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Add = "+"
        case Subtract = "-"
        case Empty = "Empty"
    }
    @IBOutlet weak var counterLbl: UILabel!
    var runningValue = ""
    var leftValue = ""
    var rightValue = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func numberPressed(btn: UIButton!) {
        runningValue += "\(btn.tag)"
        counterLbl.text = runningValue
    }

    @IBAction func onDivision(sender: AnyObject) {
        processOperation(Operation.Divide)
    }

    @IBAction func onMultiply(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onAdd(sender: AnyObject) {
       processOperation(Operation.Add)
    }
    
    @IBAction func onSubtract(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onEqual(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    
    func processOperation(op: Operation) {
        
        if currentOperation != Operation.Empty {
            //Math operations
            
            if runningValue != "" {
                rightValue = runningValue
                runningValue = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }else if currentOperation == Operation.Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }
                
                leftValue = result
                counterLbl.text = result
 
                
                
            }
            
            currentOperation = op
            
            
        }else {
            // This is first time operator is pressed
            leftValue = runningValue
            runningValue = ""
            currentOperation = op
            
            
        }
    }
    
    
    
    
    
    
}

