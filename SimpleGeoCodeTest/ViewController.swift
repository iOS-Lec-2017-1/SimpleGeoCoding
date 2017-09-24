//
//  ViewController.swift
//  SimpleGeoCodeTest
//
//  Created by 김종현 on 2017. 9. 24..
//  Copyright © 2017년 김종현. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Reverse GeoCoding
        let geoCoder: CLGeocoder = CLGeocoder()
        
        // DIT 35.166083, 129.072669
        let myLocation: CLLocation = CLLocation(latitude: 35.166083, longitude: 129.072669)
        
        geoCoder.reverseGeocodeLocation(myLocation, completionHandler: {
             (placemarks, error) -> Void in
                
            let myPlacemark: CLPlacemark = placemarks!.first!
            print("myPlacemark = \(myPlacemark)")
                
        })
        
        // GeoCoding
        let geoCoder2: CLGeocoder = CLGeocoder()
        let myAddress = "부산광역시 부산진구 양정1동 양지로 54"
        geoCoder2.geocodeAddressString(myAddress, completionHandler: {
            (placemarks, error) -> Void in
                
                let myCoordinate = placemarks!.first
                let lat = myCoordinate?.location?.coordinate.latitude
                let long = myCoordinate?.location?.coordinate.longitude
                print("latttude = \(String(describing: lat))  longitude = \(String(describing: long))")
                
            })
        
    }

}

