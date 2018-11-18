//
//  ViewController.swift
//  Hustle Mode On
//
//  Created by Manjunath Shenoy on 18/11/18.
//  Copyright © 2018 Manjunath Shenoy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustkeLbl: UILabel!
    @IBOutlet weak var onLbl: UILabel!
    @IBOutlet weak var hustleOff: UIButton!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        }catch let error as NSError{
            print(error.description)
        }
    }
    
    @IBAction func hustleOffPressed(_ sender: Any) {
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 500, width: 375, height: 142)
            self.player.play()
        }) { (finished) in
            self.hustkeLbl.isHidden = true
            self.onLbl.isHidden = true
            self.cloudHolder.isHidden = true
            self.darkBlueBG.isHidden = false
            self.powerBtn.isHidden = false
            self.hustleOff.isHidden = true
        }
        
       
        
        
    }
    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 250, width: 375, height: 142)
        }) { (finished) in
            self.hustkeLbl.isHidden = false
            self.onLbl.isHidden = false
            self.hustleOff.isHidden = false
        }
    }
    


}

