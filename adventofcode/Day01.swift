
enum Day01 {}

// There's going to be dividing and rounding, so use Double not Int
func convertMasses(input: String) -> [Double] {
    input
        .split(separator: "\n")
        .compactMap(Double.init)
}

func calculateFuel(forMass mass: Double) -> Double {
    var result = mass / 3
    result = result.rounded(.down)
    result = result - 2
    return result
}

func calculateSum(forMasses masses: [Double]) -> Double {
    var result: Double = 0
    for mass in masses {
        result += calculateFuel(forMass: mass)
    }
    return result
}

func calculateTotalFuel(forMass mass: Double) -> Double {
    var total = 0.0
    var newFuel = calculateFuel(forMass: mass)
    while newFuel > 0 {
        total += newFuel
        newFuel = calculateFuel(forMass: newFuel)
    }
    return total
}

func calculateTotalSum(for masses: [Double]) -> Double {
    var result = 0.0
    for mass in masses {
        result += calculateTotalFuel(forMass: mass)
    }
    return result
}

extension Day01 {

    struct Part1 {

        func test() {
            assert(calculateFuel(forMass: 12) == 2)
            assert(calculateFuel(forMass: 14) == 2)
            assert(calculateFuel(forMass: 1969) == 654)
            assert(calculateFuel(forMass: 100756) == 33583)
        }

        func result() -> String {
            let masses = convertMasses(input: Day01.input)
            let result = calculateSum(forMasses: masses)
            return String(result)
        }
    }

    struct Part2 {

        func test() {
            assert(calculateTotalFuel(forMass: 14) == 2)
            assert(calculateTotalFuel(forMass: 1969) == 966)
            assert(calculateTotalFuel(forMass: 100756) == 50346)
        }

        func result() -> String {
            let masses = convertMasses(input: Day01.input)
            let result = calculateTotalSum(for: masses)
            return String(result)
        }
    }

    private static let input = """
    83133
    130874
    140147
    117477
    144367
    54627
    133133
    65928
    76778
    102928
    135987
    125674
    74597
    136246
    117771
    92413
    64422
    56693
    92601
    54694
    95137
    86188
    126454
    99142
    94487
    53785
    69679
    123479
    124598
    121152
    146564
    101173
    82025
    55187
    84083
    69403
    114456
    84722
    88667
    80619
    121281
    118139
    125808
    54034
    81780
    116401
    136396
    137830
    108481
    103712
    144950
    85621
    57973
    99549
    107704
    115782
    83445
    91681
    87607
    52745
    76839
    61881
    73658
    102315
    100651
    72929
    124015
    134764
    135088
    127294
    66563
    100125
    83062
    91212
    143130
    78993
    58940
    120981
    110504
    142779
    95328
    135936
    84490
    112005
    101554
    111185
    124249
    126525
    96909
    145482
    140368
    83014
    77784
    130376
    79031
    122317
    100188
    66679
    89074
    120969
    """
}
