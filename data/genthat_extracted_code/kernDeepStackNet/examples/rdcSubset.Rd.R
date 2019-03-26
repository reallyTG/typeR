library(kernDeepStackNet)


### Name: rdcSubset
### Title: Randomized dependence coefficients score on given subset
### Aliases: rdcSubset
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

# Score of true subset
scoreTrue <- rdcSubset(binCode=c(rep(1, 3), rep(0, 7)), 
x=X, y=y, seedX=1:10, seedY=-(1:10), rdcRep=10)
scoreTrue

# Only unneccessary variables
scoreFalse <- rdcSubset(binCode=c(rep(0, 3), rep(1, 7)), 
x=X, y=y, seedX=1:10, seedY=-(1:10), rdcRep=10)
scoreFalse

# One important two important variables and some non causal variables
scoreMix <- rdcSubset(binCode=c(1, 0, 1, rep(0, 3), rep(1, 4)), 
x=X, y=y, seedX=1:10, seedY=-(1:10), rdcRep=10)
scoreMix




