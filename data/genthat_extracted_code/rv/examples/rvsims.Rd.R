library(rv)


### Name: rvsims
### Title: Create Random Vectors from Simulation Draws
### Aliases: rvsims
### Keywords: classes

### ** Examples


  ## x and y have the same distributions but not the same simulations:
  n.sims <- 200L
  setnsims(n.sims)
  y <- rvnorm(1)
  x1 <- rvsims(rnorm(n.sims))
  ##
  s <- sims(x1)
  z <- array(s) ## One-dimensional array
  x2 <- rvsims(z) ## Same as 
  ##
  identical(x1, x2) ## TRUE
  ##
  s <- t(array(rnorm(n.sims * 2, mean=c(0, 10)), dim=c(2, n.sims)))
  x3 <- rvsims(s)
  identical(2L, length(x3)) ## TRUE




