//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
  //Place your instance variables here
  let questions = QuestionBank().list
  var ourAnswer: Bool = false
  var score: Int = 0;
  var currentQuestion: Int = 0
    
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet var progressBar: UIView!
  @IBOutlet weak var progressLabel: UILabel!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }


  @IBAction func answerPressed(_ sender: AnyObject) {
    if sender.tag == 1 {
      ourAnswer = true
    } else {
      ourAnswer = false
    }
    checkAnswer()
    
    currentQuestion += 1
    
    updateUI()
    
  }
  
  
  func updateUI() {
    progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(currentQuestion)
    
    progressLabel.text = String(currentQuestion) + "/13"
    
    scoreLabel.text = "Score" + String(score)
    
    nextQuestion()
  }
  

  func nextQuestion() {
    if (currentQuestion < questions.count ) {
      questionLabel.text = questions[currentQuestion].questionText
    } else {
      let alert = UIAlertController(title: "Awesome", message: "You have finished all the questions, would you like to start over?", preferredStyle: .alert)
      
      let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {
        UIAlertAction in self.startOver()
      })
      
      alert.addAction(restartAction)
      present(alert, animated: true, completion: nil)
    }
  }
  
  
  func checkAnswer() {
    let correctAnswer = questions[currentQuestion].answer
    
    if correctAnswer == ourAnswer {
      score += 1
    } else {
      
    }
  }
  
  
  func startOver() {
    currentQuestion = 0
    score = 0
    
    updateUI()
  }
    
}
