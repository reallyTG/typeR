library(miscF)


### Name: rmvst
### Title: Generate Random Samples from a Multivariate Skew t Distribution
### Aliases: rmvst
### Keywords: distribution

### ** Examples

  Mu <- rep(0, 2)
  Sigma <- diag(c(1,1))
  D <- diag(c(1,1))
  nu <- 5
  Y <- rmvst(n=100, D, Mu, Sigma, nu)



