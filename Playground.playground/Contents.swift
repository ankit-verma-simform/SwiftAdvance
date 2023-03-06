/*
 Name: Ankit Verma
 Topic: Protocols and Delegates
 */

protocol FullyNamed {
    var fullName: String { get }
}

struct Person : FullyNamed {
    var fullName: String
}

var person = Person(fullName: "Ankit Verma")
person.fullName = "Verma Ankit"

// protocol inheritance

protocol Engine {
    func startEngine()
    func stopEngine()
}

protocol Safety {
    func applyEmergencyBreaks()
    func releaseAirBags()
    func handBreak()
}

protocol SpeedControl {
    func increaseSpeed()
    func decreaseSpeed()
}

protocol Vehicle: Engine, Safety, SpeedControl {
    var speed: Int { get set }
    var wheels: Int { get set }
    var fuelTank: Int { get set }
}

class Car : Vehicle {
    var speed: Int = 0
    var wheels: Int = 0
    var fuelTank: Int = 0
    
    func startEngine() {
        print("engine started")
    }
    
    func stopEngine() {
        print("engine stopped")
    }
    
    func applyEmergencyBreaks() {
        print("applied emergency breaks")
    }
    
    func releaseAirBags() {
        print("released air bags")
    }
    
    func handBreak() {
        print("pulled hand break")
    }
    
    func increaseSpeed() {
        print("speed increased")
        speed += 1
    }
    
    func decreaseSpeed() {
        print("speed decreased")
        speed -= 1
    }
}

// adding mutating requirements with protocols

protocol Togglable {
    mutating func toggle()
}

enum SwitchButton : Togglable {
    case on, off
    
    mutating func toggle() {
        switch self {
        case .off: self = .on
        case .on: self = .off
        }
    }
}

var switchButton = SwitchButton.on
switchButton.toggle()
print(switchButton)

class FanSwitch : Togglable {
    enum Switch {
        case on, off
    }
    var state: Switch = .on
    
    func toggle() {
        switch state {
        case .on: state = .off
        case .off: state = .on
        }
    }
}

var fanSwitch = FanSwitch()


protocol Printable {
    var print: String { get }
}

extension Array : Printable {
    var print: String {
        """
        This array contains \(count) elements!
        \(self)
        """
    }
}
 
[0].print

protocol ClassOnlyProtocol: AnyObject {
    func getSectret()
}

class CustomClass: ClassOnlyProtocol {
    func getSectret() {
        print("Secret only known to classes")
    }
}

//struct CustomStructure: ClassOnlyProtocol {
//    // won't compile - can't conform to class only protocol
//}
