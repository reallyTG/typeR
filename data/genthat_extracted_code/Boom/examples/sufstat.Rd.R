library(Boom)


### Name: sufstat.Rd
### Title: Sufficient Statistics
### Aliases: RegressionSuf

### ** Examples


  X <- cbind(1, matrix(rnorm(3 * 100), ncol = 3))
  y <- rnorm(100)

  ## Sufficient statistics can be computed from raw data, if it is
  ## available.
  suf1 <- RegressionSuf(X, y)

  ## The individual components can also be computed elsewhere, and
  ## provided as arguments.  If n is very large, this can be a
  ## substantial coomputational savings.
  suf2 <- RegressionSuf(xtx = crossprod(X),
                        xty = crossprod(X, y),
                        yty = sum(y^2),
                        n = 100,
                        xbar = colMeans(X))




