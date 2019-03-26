library(units)


### Name: Ops.units
### Title: S3 Ops Group Generic Functions for units objects
### Aliases: Ops.units

### ** Examples

a <- set_units(1:3, m/s)
b <- set_units(1:3, m/s)
a + b
a * b
a / b
a <- as_units("kg m-3")
b <- set_units(1, kg/m/m/m)
a + b
a = set_units(1:5, m)
a %/% a
a %/% set_units(2)
set_units(1:5, m^2) %/% set_units(2, m)
a %% a
a %% set_units(2 )



