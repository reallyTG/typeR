library(Directional)


### Name: Simulation of random values from a spherical Fisher-Bingham distribution
### Title: Simulation of random values from a spherical Fisher-Bingham
###   distribution
### Aliases: rfb
### Keywords: Fisher-Bingham distribution Simulated data Kent distribution

### ** Examples

k <- 15
mu <- rnorm(3)
mu <- mu / sqrt( sum(mu^2) )
A <- cov(iris[, 1:3])
x <- rfb(50, k, mu, A)
vmf(x) ## fits a von Mises-Fisher distribution to the simulated data
## Next we simulate from a Kent distribution
A <- diag( c(-5, 0, 5) )
n <- 100
x <- rfb(n, k, mu, A) ## data follow a Kent distribution
kent.mle(x) ## fits a Kent distribution
vmf(x) ## fits a von Mises-Fisher distribution
A <- diag( c(5, 0, -5) )
n <- 100
x <- rfb(n, k, mu, A) ## data follow a Kent distribution
kent.mle(x) ## fits a Kent distribution
vmf(x) ## fits a von Mises-Fisher distribution



