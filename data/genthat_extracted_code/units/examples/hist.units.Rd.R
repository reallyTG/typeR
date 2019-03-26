library(units)


### Name: hist.units
### Title: histogram for unit objects
### Aliases: hist.units

### ** Examples

units_options(parse = FALSE) # otherwise we break on the funny symbol!
u = set_units(rnorm(100), degree_C)
hist(u)



