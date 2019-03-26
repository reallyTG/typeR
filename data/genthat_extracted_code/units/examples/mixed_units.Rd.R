library(units)


### Name: mixed_units
### Title: Create or convert to a mixed units list-column
### Aliases: mixed_units units<-.mixed_units

### ** Examples

a <- 1:4
u <- c("m/s", "km/h", "mg/L", "g")
mixed_units(a, u)
units(a) = as_units("m/s")
mixed_units(a) # converts to mixed representation



