library(reporttools)


### Name: NAtoZero
### Title: Change NAs in a vector into a given value.
### Aliases: NAtoZero
### Keywords: manip character

### ** Examples

set.seed(1977)
vec <- sample(c(round(runif(10, 1, 3)), rep(NA, 10)))
NAtoZero(vec)



