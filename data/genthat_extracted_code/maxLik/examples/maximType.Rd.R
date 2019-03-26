library(maxLik)


### Name: maximType
### Title: Type of Minimization/Maximization
### Aliases: maximType maximType.default maximType.maxim
###   maximType.MLEstimate
### Keywords: optimize methods

### ** Examples

## maximize two-dimensional exponential hat.  True maximum c(2,1):
f <- function(a) exp(-(a[1] - 2)^2 - (a[2] - 1)^2)
m <- maxNR(f, start=c(0,0))
coef(m)
maximType(m)
## Now use BFGS maximisation.
m <- maxBFGS(f, start=c(0,0))
maximType(m)



