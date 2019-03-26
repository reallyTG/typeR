library(laGP)


### Name: darg
### Title: Generate Priors for GP correlation
### Aliases: darg garg
### Keywords: nonparametric nonlinear smooth models regression spatial
###   optimize

### ** Examples

## motorcycle data
library(MASS)
X <- matrix(mcycle[,1], ncol=1)
Z <- mcycle[,2]

## get darg and garg
darg(NULL, X)
garg(list(mle=TRUE), Z)



