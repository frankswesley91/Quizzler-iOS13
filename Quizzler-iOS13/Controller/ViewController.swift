//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
// Edited by Wesley Franks 3/14/2023
//2 Enhancements
//1: Image array for correct/incorrect
//2: 4 Bonus Questions included about me

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
       let userGotItRight =  quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            let questionArray = [#imageLiteral(resourceName: "Thumbs Up 2"), #imageLiteral(resourceName: "ThumbsUp 1.jpeg")]
            questionImage.animationImages = questionArray
            questionImage.animationDuration = 2.0
            questionImage.animationRepeatCount = 4
        questionImage.startAnimating()
            //ADD IN POSITIVE PICTURE THING I DONT KNOW SOMEWHERE
        } else {
            sender.backgroundColor = UIColor.red
            let questionArray = [#imageLiteral(resourceName: "L bozo"), #imageLiteral(resourceName: "You lose 1")]
            questionImage.animationImages = questionArray
            questionImage.animationDuration = 2.0
            questionImage.animationRepeatCount = 4
        questionImage.startAnimating()
            //ADD IN A PICTURE ARRAY OR SOMETHING OF A NEGATIVE THING OR GUY HOLDING UP THE L IMAGE
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
       
    }
    
}

