//
//  ViewController.swift
//  codepath-pre-work-tip-calc
//
//  Created by Jay Naik on 12/28/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipSeg: UISegmentedControl!
    @IBOutlet weak var totalAmount: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.billAmount.delegate = self
        self.billAmount.addTarget(self, action: #selector(amountChanged), for: .allEditingEvents)

    }

    @IBAction func amountChanged(_ sender: Any) {
        self.calculate()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.calculate()
    }

    
    @IBAction func TipChanged(_ sender: Any) {
        self.calculate()
    }
    
    func calculate() {
        self.tipAmountLabel.text = "$" + String([0.15, 0.18, 0.2][tipSeg.selectedSegmentIndex] * (Double(self.billAmount.text!) ?? 0))
        let tips = [1.15, 1.18, 1.20]
        let billAmount = Double(self.billAmount.text!) ?? 0
        let totalAmount = Double(billAmount * tips[tipSeg.selectedSegmentIndex] * 100) / 100
        
        self.totalAmount.text = "$" + String(totalAmount)
    }

}

