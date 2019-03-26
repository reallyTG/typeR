library(laGP)


### Name: llikGP
### Title: Calculate a GP log likelihood
### Aliases: llikGP llikGPsep
### Keywords: nonparametric nonlinear smooth models regression spatial

### ** Examples

## partly following the example in mleGP
library(MASS)

## motorcycle data and predictive locations
X <- matrix(mcycle[,1], ncol=1)
Z <- mcycle[,2]

## get sensible ranges
d <- darg(NULL, X)
g <- garg(list(mle=TRUE), Z)

## initialize the model
gpi <- newGP(X, Z, d=d$start, g=g$start)

## calculate log likelihood
llikGP(gpi)
## calculate posterior probability
llikGP(gpi, d$ab, g$ab)

## clean up
deleteGP(gpi)



