library(DescTools)


### Name: ConvUnit
### Title: Unit Conversion and Metrix Prefixes
### Aliases: ConvUnit d.units d.prefix
### Keywords: arith

### ** Examples

ConvUnit(c(1.2, 5.4, 6.7), "in", "m")

# from kilometers to pico meters
ConvUnit(1, from="km", to="pm")

# from miles to kilometers
ConvUnit(1, from="mi", to="km")
# nautical miles
ConvUnit(1, from="nmi", to="km")
# from kilo Kelvin to Fahrenheit
ConvUnit(10, from="kK", to="F")
# from metric to more quirky units
ConvUnit(c(10, 1), from="hl", to="gal")
ConvUnit(500, from="ml", to="fl oz")

# conversion between non-SI units
ConvUnit(1000, "yd", "mi")
# ... must be the same as
ConvUnit(ConvUnit(1000, "yd", "m"), "m", "mi")



