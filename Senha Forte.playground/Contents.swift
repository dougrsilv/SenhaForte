import UIKit

func isValid(for number: String) -> Bool {
    
    guard let num = Int(number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) else { return true }
    
        let coef = 10
        var remainder = num
        var curr: Int? = nil
        var prev: Int? = nil
        var diff: Int?

        while remainder > 0 {

            defer { remainder = Int(remainder / coef) }
            prev = curr
            curr = remainder % coef
            guard let p = prev, let c = curr else { continue }
            let lastDiff = diff
            diff = p - c
            guard let ld = lastDiff else { continue }
            if ld != diff { return true }
            if diff != 1 && diff != -1 { return true }
        }
        return false
}

func checkPassword(_ password: String) -> Bool {
    
    let letters = CharacterSet.punctuationCharacters
    let range = password.rangeOfCharacter(from: letters)
    
    if range == nil {
        let number = password.filter { ("0"..."9").contains($0)}
        let index = password.index(password.startIndex, offsetBy: 0)
        
        if password.count >= 5 && password.count <= 15 && number.isEmpty == false && isValid(for: password) == true {
            for char in password {
                    if  char >= "a" && char <= "z" {
                        for char in String(password[index]) {
                            if char >= "A" && char <= "Z" {
                                return true
                            }
                        }
                    }
                }
            }
    }
    else {
       return false
    }
    return false
}

let pass1 = "Teste123"
let pass2 = "TESTE"
let pass3 = "asd"
if checkPassword(pass3) {
    print("Senha forte")
}else{
    print("Não atende os requisitos!")
}
