//
//  DexViewController.swift
//  WavesWallet-iOS
//
//  Created by Pavel Gubin on 04.07.17.
//  Copyright © 2017 Waves Platform. All rights reserved.
//

import UIKit

class DexTableListCell : UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelLow: UILabel!
    @IBOutlet weak var labelHigh: UILabel!
    @IBOutlet weak var labelPercent: UILabel!
    @IBOutlet weak var imageViewArrow: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewContent.layer.cornerRadius = 3
        viewContent.backgroundColor = UIColor.white
        viewContent.layer.shadowColor = UIColor.black.cgColor
        viewContent.layer.shadowRadius = 2
        viewContent.layer.shadowOpacity = 0.3
        viewContent.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
}

class DexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        title = "Dex"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
//        self.performSegue(withIdentifier: "DexContainerViewController", sender: nil)
    }
    
    func addTapped() {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "DexSearchViewController") as! DexSearchViewController
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: UITableView
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "DexContainerViewController", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 81
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell : DexTableListCell = tableView.dequeueReusableCell(withIdentifier: "DexTableListCell", for:indexPath) as! DexTableListCell
       
        return cell
    }
    
    //MARK: Segue
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DexContainerViewController" {
            
            let indexPath = sender
            let dexContainerViewController = segue.destination as! DexContainerViewController
            dexContainerViewController.amountAsset = "WAVES"
            dexContainerViewController.priceAsset = "8LQW8f7P5d5PZM7GtZEBgaqRPGSzS3DfPuiXrURJ4AJS"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}