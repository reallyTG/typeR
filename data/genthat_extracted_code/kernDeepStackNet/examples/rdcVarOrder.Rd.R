library(kernDeepStackNet)


### Name: rdcVarOrder
### Title: Variable ordering using randomized dependence coefficients
###   (experimental)
### Aliases: rdcVarOrder
### Keywords: models & regression

### ** Examples

#############################
# Cubic noisy association

# Generate 10 covariates
library(mvtnorm)
set.seed(3489)
X <- rmvnorm(n=200, mean=rep(0, 10))

# Generate responses based on some covariates
set.seed(-239247)
y <- 0.5*X[, 1]^3 - 2*X[, 2]^2 + X[, 3] - 1 + rnorm(200)

# Variable selection with RDC
selectedInd <- rdcVarOrder(x=X, y=y, seedX=1, seedY=2, cutoff=0.7)
selectedInd
# -> If the numbers of variables should be reduced from 10 to 3, 
# then all important variables are selected.

# With more repetitions and different random transformations
selectedInd <- rdcVarOrder(x=X, y=y, seedX=1:25, seedY=-(1:25), cutoff=0.7, rdcRep=25)
selectedInd
# -> Gives identical result as one repetition



