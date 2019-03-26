library(units)


### Name: boxplot.units
### Title: boxplot for unit objects
### Aliases: boxplot.units

### ** Examples

units_options(parse = FALSE) # otherwise we break on the funny symbol!
u = set_units(rnorm(100), degree_C)
boxplot(u)



