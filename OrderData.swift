//
//  OrderData.swift
//  CupcakeCorner
//
//  Created by Areej Hussein on 27/11/2022.
//

import Foundation
import SwiftUI

struct OrderData: Codable {
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 0
    
    var specialRequestEnabled = false {
       didSet {
           if specialRequestEnabled == false {
               extraFrosting = false
               addSprinkles = false
           }
       }
   }
    
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty ||
           name.contains(" ") || streetAddress.contains(" ") || city.contains(" ") || zip.contains(" "){
            return false
        }
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more
        cost += (Double(type) / 2 )
        
        // $1 per cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50 per cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        return cost
    }
    
}
