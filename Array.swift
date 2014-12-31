//
//  Array.swift
//

import Foundation

extension Array {
    
    func take (n: Int) -> Array<T> {
        if n == 0 {
            return []
        }
        else if n > 0 {
            return self[0...n-1]
        }
        return self[0...n-1+count]
    }
    
    func sum() -> Int {
        return reduce(0) { ($0 as Int) + ($1 as Int) }
    }
    
    func each (iterator: (T) -> Void) {
        for var i = 0; i < count; i++ {
            iterator(self[i])
        }
    }
    
    subscript (range: Range<Int>) -> Array<T> {
        var array = Array<T>()
        
        let min = range.startIndex
        let max = range.endIndex
        
        for var i = min; i < max; i++ {
            array += [self[i]]
        }
        
        return array
    }
    
    func all (test: (T) -> Bool) -> Bool {
        for item in self {
            if !test(item) {
                return false
            }
        }
        return true
    }
    
    func contains<T where T : Equatable>(obj: T) -> Bool {
        return self.filter({$0 as? T == obj}).count > 0
    }
    
    mutating func shuffle() {
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&self[i], &self[j])
        }
    }
    
    func startsWith<T where T : Equatable>(start: Array<T>) -> Bool {
        
        if start.count > self.count {
            return false
        }
        
        for var i = 0; i < start.count; i++ {
            if self[i] as? T != start[i] {
                return false
            }
        }
        return true
    }
}

public func +(lhs: [Int], rhs: Int) -> [Int] {
    return lhs + [rhs]
}
