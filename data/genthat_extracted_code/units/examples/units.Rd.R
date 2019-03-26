library(units)


### Name: units
### Title: Set measurement units on a numeric vector
### Aliases: units units<-.numeric units<-.units units<-.logical
###   units.units

### ** Examples

x = 1:3
class(x)
units(x) <- as_units("m/s")
class(x)
y = 2:5
a <- set_units(1:3, m/s)
units(a) <- with(ud_units, km/h)
a
# convert to a mixed_units object:
units(a) = c("m/s", "km/h", "km/h")
a



