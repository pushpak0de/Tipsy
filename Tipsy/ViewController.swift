//
//  ViewController.swift
//  Tipsy
//
//  Created by Pushpak Patel on 7/18/20.
//  Copyright © 2020 Pak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var peopleCounterStepper: UIStepper!
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var componentsView: UIView!
    @IBOutlet weak var totalShape: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        componentsView.alpha = 0
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func onTapTip(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        

        //Get the bill amount
        let bill = Double(self.billAmountField.text!) ?? 0
        
        
        //Calculate the tip amount
        let tipPercentages = [0.1, 0.15, 0.2]
        
        let tip = bill * tipPercentages[self.tipControl.selectedSegmentIndex]
        let total = bill + tip
        let totalPP = total / self.peopleCounterStepper.value
        
        // Update the tip and total labels
        self.tipLabel.text = String(format: "$%.2f", tip)

        self.totalLabel.text = String(format: "$%.2f", total)
        
        self.perPersonLabel.text = String(format: "$%.2f", totalPP)
        
        
        UIView.animate(withDuration: 0.5) {
            if self.billAmountField.text?.isEmpty ?? true {
                // alpha zero
                // animate thjate
                
                    self.componentsView.alpha = 0
                
            } else {
                // alpha one
                // animarte rhat
                    self.componentsView.alpha = 1
            
            }
            
            //self.backgroundView.backgroundColor = UIColor(displayP3Red: 0.2, green: CGFloat(0.5/(totalPP/100)), blue: 1.0, alpha: 1)
            
            if self.view.backgroundColor == UIColor.orange {
               UIView.animate(withDuration: 5) {
                self.view.backgroundColor = UIColor.systemRed
                self.backgroundView.backgroundColor = UIColor.systemRed
               }
            } else {
               UIView.animate(withDuration: 5) {
                  self.view.backgroundColor = UIColor.orange
                self.backgroundView.backgroundColor = UIColor.orange

               }
            }
            
            
        }
        
    }
    
    
    
    @IBAction func countPeople(_ sender: Any) {
        let counter = peopleCounterStepper.value
        splitLabel.text = String(format: "Split total with %.0f people", counter)
        calculateTip(sender)
    }

    
    
    
    
    

}
