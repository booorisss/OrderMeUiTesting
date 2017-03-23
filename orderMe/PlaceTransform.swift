//
//  PlaceTransform.swift
//  orderMe
//
//  Created by Boris Gurtovyy on 1/8/17.
//  Copyright © 2017 Boris Gurtovoy. All rights reserved.
//

import Foundation
import ObjectMapper

open class PlaceIdJsonTransform: TransformType {
    public typealias Object = Place
    public typealias JSON = Int
    
    public init() {}
    
    open func transformFromJSON(_ value: Any?) -> Object? {
        guard let places = SingleTone.shareInstance.allplaces,
              let placeId = value as? Int else {
            return nil
        }
        for place in places {
            if place.id == placeId {
                return place
            }
        }
        return nil
    }
    
    open func transformToJSON(_ value: Object?) -> JSON? {
        if let place = value {
            return place.id
        }
        return nil
    }
}


