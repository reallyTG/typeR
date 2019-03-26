library(energy)


### Name: pdcor
### Title: Partial distance correlation and covariance
### Aliases: pdcor pdcov pdcor.test pdcov.test
### Keywords: htest multivariate nonparametric

### ** Examples

  n = 30
  R <- 199

  ## mutually independent standard normal vectors
  x <- rnorm(n)
  y <- rnorm(n)
  z <- rnorm(n)

  pdcor(x, y, z)
  pdcov(x, y, z)
  pdcov.test(x, y, z, R=R)
  print(pdcor.test(x, y, z, R=R))


if (require(MASS)) {
  p = 4
  mu <- rep(0, p)
  Sigma <- diag(p)

  ## linear dependence
  y <- mvrnorm(n, mu, Sigma) + x
  print(pdcov.test(x, y, z, R=R))

  ## non-linear dependence
  y <- mvrnorm(n, mu, Sigma) * x
  print(pdcov.test(x, y, z, R=R))
  }



