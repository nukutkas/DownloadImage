//
//  ViewController.swift
//  Networking
//
//  Created by Татьяна Кочетова on 21.04.2021.


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var getImageButton: UIButton!
    
    @IBAction func getImagePressed(_ sender: Any) {
        guard let url = URL(string: "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg") else { return }
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.label.isHidden = true
                    self.getImageButton.isEnabled = false
                    self.imageView.image = image
                }
            }
        }.resume()
    }
    
}

