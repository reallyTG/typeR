library(miscF)


### Name: mvt.ecme
### Title: Estimate Parameters of a Multivariate t Distribution Using the
###   ECME Algorithm
### Aliases: mvt.ecme
### Keywords: multivariate

### ** Examples

  mu1 <- mu2 <- sigma12 <- sigma22 <- 100
  rho12 <- 0.7
  Sigma <- matrix(c(sigma12, rho12*sqrt(sigma12*sigma22),
                    rho12*sqrt(sigma12*sigma22), sigma22),
                  nrow=2)
  k <- 5
  N <- 100
  require(mvtnorm)
  X <- rmvt(N, sigma=Sigma, df=k, delta=c(mu1, mu2))

  result <- mvt.ecme(X, 3, 300)
  result$Mu
  result$Sigma
  result$v



