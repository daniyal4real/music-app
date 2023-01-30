//
//  GenreButtonScreen.swift
//  musicPlayer
//
//  Created by Daniyal Ganiuly on 30.01.2023.
//

import UIKit
import MediaPlayer


class GenreButtonScreen: UIViewController {
    
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let comedyButton = UIButton(frame: CGRect(x: view.frame.size.width / 10, y: 100, width: view.frame.size.width * 0.8, height: view.frame.size.height / 12))
        comedyButton.backgroundColor = .systemGreen
        comedyButton.setTitle("Comedy", for: .normal)
        comedyButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        comedyButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        
        self.view.addSubview(comedyButton)
        
        
        
        
        let popButton = UIButton(frame: CGRect(x: view.frame.size.width / 10, y: 250, width: view.frame.size.width * 0.8, height: view.frame.size.height / 12))
        popButton.backgroundColor = .systemBlue
        popButton.setTitle("Pop", for: .normal)
        popButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        popButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(popButton)
        
        
        let rapButton = UIButton(frame: CGRect(x: view.frame.size.width / 10, y: 400, width: view.frame.size.width * 0.8, height: view.frame.size.height / 12))
        
        rapButton.backgroundColor = .systemYellow
        rapButton.setTitle("Hip-Hop/Rap", for: .normal)
        rapButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        rapButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(rapButton)
    
        
        let stopButton = UIButton(frame: CGRect(x: view.frame.size.width / 10, y: 550, width: view.frame.size.width * 0.4, height: view.frame.size.width / 6))
        stopButton.setTitle("Stop", for: .normal)
        stopButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        stopButton.backgroundColor = .systemRed
        
        view.addSubview(stopButton)
        
        
        let nextButton = UIButton(frame: CGRect(x: view.frame.size.width / 2, y: 550, width: view.frame.size.width * 0.4, height: view.frame.size.width / 6))
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = .systemTeal
        nextButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        view.addSubview(nextButton)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    
    @objc func stopButtonAction(sender: UIButton!) {
        musicPlayer.stop()
    }
    
    
    @objc func nextButtonAction(sender: UIButton!) {
        musicPlayer.skipToNextItem()
    }
    
    
    func playGenre(genre: String) {
        musicPlayer.stop()

        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)


        query.addFilterPredicate(predicate)

        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
    


}
