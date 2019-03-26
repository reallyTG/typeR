library(miscF)


### Name: mvn.bayes
### Title: Estimate the Parameters of a Multivariate Normal Model by the
###   Bayesian Methods
### Aliases: mvn.bayes
### Keywords: multivariate

### ** Examples

  Sigma <- matrix(c(100, 0.99*sqrt(100*100),
                      0.99*sqrt(100*100), 100),
                      nrow=2)
  X <- mvrnorm(1000, c(100, 100), Sigma)
  result <- mvn.bayes(X, 10000)
  Mu <- colMeans(result$Mu.save)
  Sigma <- apply(result$Sigma.save, c(1,2), mean)



