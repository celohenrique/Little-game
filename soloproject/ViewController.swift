//
//  ViewController.swift
//  soloproject
//
//  Created by Marcelo Araujo on 02/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var randomNumLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    
    @IBAction func resetButton(_ sender: Any) {
        
        soma = 0
        round = 0
        scoreLabel.text = "\(soma)"
        roundLabel.text = "\(round)"
    }
    
    
    
    func randomNumberGen() -> Int {
        
        let random = Int.random(in: 1...100)
        
        return random
        
    }
    
    
    var round : Int = 0
    var soma = 0

    var randomTwo : Int = Int.random(in: 1...100)
    
    @IBAction func buttonHitMe(_ sender: Any) {
        
       // var soma : [Int] = [0]
        var valorSlider : Int = Int(slider.value)
        let randomGen = randomNumberGen()
        
        func userScore(valorDoSlider: Int){
            
            var diferencaValores = abs(valorDoSlider - randomTwo)
            
            if diferencaValores == 0 && round >= 1{
                soma += 100
                alertShowing(withTitle: "Perfcto", message: "you got 100 points")
                //soma.append(100)
                
            }
            
            if diferencaValores <= 2 {
                soma += 80
                alertShowing(withTitle: "almost there", message: "you got 80 points")
               // soma.append(80)
                
            }
            
            else if diferencaValores <= 5 {
                soma += 60
                alertShowing(withTitle: "you are on the way", message: "you got 60 points")
               // soma.append(60)
            }
            
            else if diferencaValores <= 10 {
                soma += 30
                alertShowing(withTitle: "not really got, keep working", message: "you got 30")
               // soma.append(30)
            }
            
            else if diferencaValores >= 10 && diferencaValores <= 24 {
                soma += 10
                alertShowing(withTitle: "are you blind?", message: "you got 10")
                //soma.append(10)
            }
            
            
            else {
                alertShowing(withTitle: "Go to the doctor", message: "you got 0 points")
                soma += 0
                //soma.append(0)
            }
            
            let deafults = UserDefaults.standard
            deafults.set(soma, forKey: "Score")
            
        }
        
        
       // var somaAll = soma.reduce(0, +)
     userScore(valorDoSlider: valorSlider)
        
     //scoreLabel.text = ("your score is: \(sumScore(sum: soma))")
        
        //print(valorSlider)
        
    }
    
    func sumScore() {

        scoreLabel.text = "\(soma)"

    }
    
    
    override func viewDidLoad() {
        
        scoreLabel.text = "\(soma)"
        randomNumLabel.text = ("get to: \(randomTwo)")
        roundLabel.text = ("round: \(round)")
        soma = UserDefaults.standard.integer(forKey: "Score")
        sumScore()
//        deafults.set(soma, forKey: "savedSoma")
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func alertShowing(withTitle title: String, message : String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { [self] action in
            let randomGen = self.randomNumberGen()
            self.randomNumLabel.text = ("get to: \(randomGen)")
            self.randomTwo = randomGen
            self.round += 1
            self.roundLabel.text = ("round: \(self.round)")
            self.sumScore()
            
            
            //deafults.set(self.sumScore(), forKey: "savedSoma")
            
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
}
