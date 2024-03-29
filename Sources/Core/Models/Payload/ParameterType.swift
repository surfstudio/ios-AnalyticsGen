//
//  ParameterType.swift
//  
//
//  Created by Alexander Filimonov on 01/03/2020.
//

/// Enum that describes type of parameter
public enum ParameterType {
    case date
    case int
    case double
    case bool
    case string
    case customEnum(name: String)

    // MARK: - Initialization

    public init(raw: String) {
        switch raw.lowercased() {
        case "date":
            self = .date
        case "int":
            self = .int
        case "double":
            self = .double
        case "bool":
            self = .bool
        case "string":
            self = .string
        default:
            self = .customEnum(name: raw)
        }
    }

    public func stringValue() -> String {
        switch self {
        case .date:
            return "date"
        case .int:
            return "int"
        case .double:
            return "double"
        case .bool:
            return "bool"
        case .string:
            return "string"
        case .customEnum(let name):
            return name
        }
    }

}

extension ParameterType: Equatable {

    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.date, .date),
             (.int, .int),
             (.double, .double),
             (.bool, .bool),
             (.string, .string):
            return true
        case (.customEnum(let lhsEnumName), .customEnum(let rhsEnumName)):
            return lhsEnumName == rhsEnumName
        default:
            return false
        }
    }

}
