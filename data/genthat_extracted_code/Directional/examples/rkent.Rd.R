library(Directional)


### Name: Simulation of random values from a spherical Kent distribution
### Title: Simulation of random values from a spherical Kent distribution
### Aliases: rkent
### Keywords: Kent distribution Simulated data

### ** Examples

k <- 15
mu <- rnorm(3)
mu <- mu / sqrt( sum(mu^2) )
A <- diag( c(-5, 0, 5) )
x <- rfb(500, k, mu, A)
kent.mle(x)
y <- rkent(500, k, mu, A[3, 3])
kent.mle(y)



