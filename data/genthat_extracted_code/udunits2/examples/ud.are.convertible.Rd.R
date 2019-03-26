library(udunits2)


### Name: ud.are.convertible
### Title: Determine whether two units may be converted between each other
### Aliases: ud.are.convertible

### ** Examples

ud.are.convertible("miles", "km")        # TRUE
ud.are.convertible("grams", "kilograms") # TRUE
ud.are.convertible("celsius", "grams")   # FALSE
ud.are.convertible("not", "parseable")   # FALSE



