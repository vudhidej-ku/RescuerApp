//
//  Request.swift
//  RescuerApp
//
//  Created by CNC on 17/12/2561 BE.
//

import FirebaseFirestore

class Request {
    
    var documentID: String
    
    var phoneNumber: String
    var requestLocation: GeoPoint
    
    var rescuerID: String?
    var rescuerLocation: GeoPoint?
    var rescuerName: String?
    var status: Int
    
    /// Initializes a request with a documentID auto-generated by Firestore.
    init(
        documentID: String,
        phoneNumber: String,
        requestLocation: GeoPoint,
        rescuerID: String,
        rescuerLocation: GeoPoint,
        rescuerName: String,
        status: Int
        ) {
        self.documentID = documentID
        self.phoneNumber = phoneNumber
        self.requestLocation = requestLocation
        self.rescuerID = rescuerID
        self.requestLocation = requestLocation
        self.status = status
    }
    
    init (documentID: String,
          phoneNumber: String,
          requestLocation: GeoPoint,
          status: Int) {
        self.documentID = documentID
        self.phoneNumber = phoneNumber
        self.requestLocation = requestLocation
        self.status = status
    }
    
    init (phoneNumber: String,
          requestLocation: GeoPoint,
          status: Int) {
        let requestRef = Firestore.firestore().collection("requests").document()
        self.documentID = requestRef.documentID
        self.phoneNumber = phoneNumber
        self.requestLocation = requestLocation
        self.status = status
    }
    
    init? (document: DocumentSnapshot) {
        
        guard let data = document.data() else { return nil }
        
        self.documentID = document.documentID
        self.phoneNumber = data["phoneNumber"] as! String
        self.requestLocation = data["requestLocation"] as! GeoPoint
        self.status = data["status"] as! Int
        
        if ((data["status"] as! Int == 1) || (data["status"] as! Int == 2)) {
            
            self.rescuerID = data["rescuerID"] as? String
            self.rescuerLocation = data["rescuerLocation"] as? GeoPoint
            self.rescuerName = data["rescuerName"] as? String
            
        }
        
    }
    
    init? (document: QueryDocumentSnapshot) {
        let data = document.data()
        self.documentID = document.documentID
        self.phoneNumber = data["phoneNumber"] as! String
        self.requestLocation = data["requestLocation"] as! GeoPoint
        self.status = data["status"] as! Int
        
        if ((data["status"] as! Int == 1) || (data["status"] as! Int == 2)) {
            
            self.rescuerID = data["rescuerID"] as? String
            self.rescuerLocation = data["rescuerLocation"] as? GeoPoint
            self.rescuerName = data["rescuerName"] as? String
            
        }
    }
}
