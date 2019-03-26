library(miscF)


### Name: mvn.ub
### Title: Unbiased Estimate of Parameters of a Multivariate Normal
###   Distribution
### Aliases: mvn.ub
### Keywords: multivariate

### ** Examples

  Sigma <- matrix(c(100, 0.99*sqrt(100*100),
                      0.99*sqrt(100*100), 100),
                      nrow=2)
  X <- mvrnorm(1000, c(100, 100), Sigma)
  result <- mvn.ub(X)



