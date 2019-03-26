library(copula)


### Name: fhCopula
### Title: Construction of Fréchet-Hoeffding Bound Copula Objects
### Aliases: fhCopula lowfhCopula upfhCopula
### Keywords: distribution multivariate

### ** Examples

## Lower bound  W : -------------------------

try(W <- lowfhCopula(dim = 3)) # lower bound is *not* a copula for dim > 2
W <- lowfhCopula()
wireframe2(W, FUN = pCopula)
plot(W, n=100) # perfect anti-correlation ( rho = tau = -1 )

## Upper bound  M : -------------------------

wireframe2(upfhCopula(dim = 2), pCopula)
M <- upfhCopula(dim = 3)
set.seed(271)
splom2(M, n = 100) # "random" data: all perfectly correlated



