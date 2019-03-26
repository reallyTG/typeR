library(units)


### Name: install_conversion_constant
### Title: Install a conversion constant or offset between user-defined
###   units.
### Aliases: install_conversion_constant install_conversion_offset

### ** Examples


# one orange is worth two apples
install_symbolic_unit("orange")
install_conversion_constant("orange", "apple", 2) # apple = 2 * orange
apples <- 2 * as_units("apple")
oranges <- 1 * as_units("orange")
apples + oranges
oranges + apples

install_conversion_offset("meter", "newmeter", 1)
m = set_units(1:3, meter)
n = set_units(1:3, newmeter)
m + n
n + m



