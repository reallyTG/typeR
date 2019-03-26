library(MASS)


### Name: mvrnorm
### Title: Simulate from a Multivariate Normal Distribution
### Aliases: mvrnorm
### Keywords: distribution multivariate

### ** Examples

Sigma <- matrix(c(10,3,3,2),2,2)
Sigma
var(mvrnorm(n = 1000, rep(0, 2), Sigma))
var(mvrnorm(n = 1000, rep(0, 2), Sigma, empirical = TRUE))



