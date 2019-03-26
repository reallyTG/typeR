library(kernDeepStackNet)


### Name: rdcVarSelSubset
### Title: Variable selection based on RDC with genetic algorithm
###   (experimental)
### Aliases: rdcVarSelSubset
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Generate 10 covariates
library(mvtnorm)
set.seed(3489)
X <- rmvnorm(n=200, mean=rep(0, 10))

# Generate responses based on some covariates
set.seed(-239247)
y <- 0.5*X[, 1]^3 - 2*X[, 2]^2 + X[, 3] - 1 + rnorm(200)

# Running variable selection
foundVar <- rdcVarSelSubset(x=X, y=y, seedX=1, seedY=-(1), rdcRep=1, 
popSize=80, maxiter=5)
foundVar




