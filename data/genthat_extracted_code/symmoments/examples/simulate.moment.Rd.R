library(symmoments)


### Name: simulate.moment
### Title: Method to compute a multivariate moment using Monte Carlo
###   integration
### Aliases: ' simulate.moment '

### ** Examples

# Using 10000 samples, estimate the central moment for the moment c(2,4) at the covariance matrix
#  2 1
#  1 4

# and mean (0,0)
library(mvtnorm)
simulate(callmultmoments(c(2,4)),10000,NULL,c(0,0),c(2,1,1,4))



