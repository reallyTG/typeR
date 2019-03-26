library(copula)


### Name: htrafo
### Title: GOF Testing Transformation of Hering and Hofert
### Aliases: htrafo
### Keywords: transformation distribution multivariate

### ** Examples

## Sample and build pseudo-observations (what we normally have available)
## of a Clayton copula
tau <- 0.5
theta <- iTau(claytonCopula(), tau = tau)
d <- 5
cc <- claytonCopula(theta, dim = d)
set.seed(271)
n <- 1000
U <- rCopula(n, copula = cc)
X <- qnorm(U) # X now follows a meta-Gumbel model with N(0,1) marginals
U <- pobs(X) # build pseudo-observations

## Graphically check if the data comes from a meta-Clayton model
## with the transformation of Hering and Hofert (2014):
U.H <- htrafo(U, copula = cc) # transform the data
splom2(U.H, cex = 0.2) # looks good

## The same for an 'outer_nacopula' object
cc. <- onacopulaL("Clayton", list(theta, 1:d))
U.H. <- htrafo(U, copula = cc.)
splom2(U.H., cex = 0.2) # looks good

## What about a meta-Gumbel model?
## The parameter is chosen such that Kendall's tau equals (the same) tau
gc <- gumbelCopula(iTau(gumbelCopula(), tau = tau), dim = d)

## Plot of the transformed data (Hering and Hofert (2014)) to see the
## deviations from uniformity
U.H.. <- htrafo(U, copula = gc)
splom2(U.H.., cex = 0.2) # deviations visible



