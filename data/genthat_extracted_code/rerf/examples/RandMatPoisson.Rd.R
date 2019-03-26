library(rerf)


### Name: RandMatPoisson
### Title: Create a Random Matrix: Poisson
### Aliases: RandMatPoisson

### ** Examples


p <- 8
d <- 8
lambda <- 0.5
paramList <- list(p = p, d = d, lambda = lambda)
set.seed(8)
(a <- do.call(RandMatPoisson, paramList))



