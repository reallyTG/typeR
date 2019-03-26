library(scdensity)


### Name: SequentialLineMin
### Title: Minimize a function of r variables by sequential univariate
###   searches.
### Aliases: SequentialLineMin

### ** Examples

fcn <- function(v) (v[1]+1)^2 + (v[2]-1)^2
SequentialLineMin(fcn, c(-5,5), c(-3,3))




