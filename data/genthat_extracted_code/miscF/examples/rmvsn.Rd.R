library(miscF)


### Name: rmvsn
### Title: Generate Random Samples from a Multivariate Skew Normal
###   Distribution
### Aliases: rmvsn
### Keywords: distribution

### ** Examples

  Mu <- rep(400, 2)
  Sigma <- diag(c(40, 40))
  D <- diag(c(-30, -30))
  Y <- rmvsn(n=1000, D, Mu, Sigma)



