library(eRm)


### Name: sim.xdim
### Title: Simulation of multidimensional binary data
### Aliases: sim.xdim
### Keywords: models

### ** Examples


# 500 persons, 10 items, 3 dimensions, random weights.
Sigma <- matrix(c(1, 0.01, 0.01, 0.01, 1, 0.01, 0.01, 0.01, 1), 3)
X <- sim.xdim(500, 10, Sigma)

#500 persons, 10 items, 2 dimensions, weights fixed to 0.5
itemvec <- runif(10, -2, 2)
Sigma <- matrix(c(1, 0.05, 0.05, 1), 2)
weights <- matrix(0.5, ncol = 2, nrow = 10)
X <- sim.xdim(500, itemvec, Sigma, weightmat = weights)




