//
//  ViewController.swift
//  testPrimeNumbers
//
//  Created by Artour Ilyasov on 23.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!
    
    @IBOutlet weak var primeNumsChangingLabel: UILabel!
    @IBOutlet weak var primeNumsWithSum5ChangingLabel: UILabel!
    @IBOutlet weak var primeNumsSumChangingLabel: UILabel!
    
    @IBOutlet weak var primeNumsSumLabel: UILabel!
    @IBOutlet weak var primeNumsWithSum5Label: UILabel!
    @IBOutlet weak var primeNumsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func calculateButton(_ sender: Any) {
        let from = fromTextField.text
        let to = toTextField.text
        
        guard let from, let to else { return }
        guard let doubleFrom = Double(from), let doubleTo = Double(to) else { return }
        if doubleFrom > doubleTo { return }
        
        processingRange(ClosedRange(uncheckedBounds: (lower: doubleFrom, upper: doubleTo)))
    }
    
    func isPrime(_ number: Int) -> Bool {
        guard number > 1 else { return false }
        for i in 2..<Int(number) {
            if Int(number) % i == 0 {
                return false
            }
        }
        return true
    }
    
    func digitSum(_ number: Int) -> Int {
        var sum = 0
        var n = Int(number)
        while n > 0 {
            sum += n % 10
            n /= 10
        }
        return sum
    }

    func processingRange(_ range: ClosedRange<Double>) {
        
        let intRange = Int(range.lowerBound)...Int(range.upperBound)
        
        var primes = [Int]()
        var primesWithSum5 = [Int]()
        var sumOfPrimes = 0
        
        for number in intRange {
            if isPrime(number) {
                primes.append(number)
                sumOfPrimes += digitSum(number)
                if digitSum(number) == 5 {
                    primesWithSum5.append(number)
                }
            }
        }
        setValues(primes: primes, primesWithSum5: primesWithSum5, sumOfPrimes: sumOfPrimes)
    }

    func setValues(primes: [Int], primesWithSum5: [Int], sumOfPrimes: Int) {
        let stringPrimes = primes.map { String("\($0), ") }.joined()
        let labelPrimes = stringPrimes.dropLast(2)
        let stringPrimesWithSum5 = primesWithSum5.map { String("\($0), ") }.joined()
        let labelPrimesWithSum5 = stringPrimesWithSum5.dropLast(2)
        
        primeNumsChangingLabel.text = String(labelPrimes)
        primeNumsWithSum5ChangingLabel.text = String(labelPrimesWithSum5)
        primeNumsSumChangingLabel.text = String(sumOfPrimes)
    }
    
    
}

