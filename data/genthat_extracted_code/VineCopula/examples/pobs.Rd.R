library(VineCopula)


### Name: pobs
### Title: Pseudo-Observations
### Aliases: pobs

### ** Examples


## Simple definition of the function:
pobs

## simulate data from a multivariate normal distribution
library(mvtnorm)
set.seed(123)
Sigma <- matrix(c(2, 1, -0.2, 1, 1, 0.3, -0.2, 0.3, 0.5), 3, 3)
mu <- c(-3, 2, 1)
dat <- rmvnorm(500, sigma = Sigma)
pairs(dat)  # plot observations

## compute pseudo-observations for copula inference
udat <- pobs(dat)
pairs(udat)
# estimate vine copula model
fit <- RVineStructureSelect(udat, familyset = c(1, 2))




