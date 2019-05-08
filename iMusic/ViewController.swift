//
//  ViewController.swift
//  iMusic
//
//  Created by bagasstb on 07/05/19.
//  Copyright © 2019 xProject. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "sample", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            setSlider(max: audioPlayer.duration)
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAudioProgress), userInfo: nil, repeats: true)
            audioPlayer.play()
        } catch {
            print(error)
        }
    }
    
    @objc func updateAudioProgress() {
        if audioPlayer.isPlaying{
            slider.setValue(Float(audioPlayer.currentTime), animated: true)
        }
    }
    
    private func setSlider(max: TimeInterval) {
        slider.maximumValue = Float(max)
    }
    
    @IBAction func playPressed(_ sender: UIButton) {
        if audioPlayer.isPlaying {
            audioPlayer.stop()
            setImageButton(named: "Play")
        } else {
            audioPlayer.play()
            setImageButton(named: "Stop")
        }
    }
    
    private func setImageButton(named: String) {
        playButton.setBackgroundImage(UIImage(named: named), for: .normal)
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func prevButton(_ sender: UIButton) {
        
    }
    
}

