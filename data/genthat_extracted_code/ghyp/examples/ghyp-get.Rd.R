library(ghyp)


### Name: ghyp-get
### Title: Get methods for objects inheriting from class ghyp
### Aliases: ghyp.data ghyp.name ghyp.fit.info ghyp.dim
### Keywords: utilities

### ** Examples

  ## multivariate generalized hyperbolic distribution
  ghyp.mv <- ghyp(lambda = 1, alpha.bar = 0.1, mu = rep(0, 2), sigma = diag(rep(1, 2)),
                  gamma = rep(0, 2), data = matrix(rt(1000, df = 4), ncol = 2))

  ## Get data
  ghyp.data(ghyp.mv)

  ## Get the dimension
  ghyp.dim(ghyp.mv)

  ## Get the name of the ghyp object
  ghyp.name(ghyp(alpha.bar = 0))
  ghyp.name(ghyp(alpha.bar = 0, lambda = -4), abbr = TRUE)

  ## 'ghyp.fit.info' does only work when the object is of class 'mle.ghyp',
  ## i.e. is created by 'fit.ghypuv' etc.
  mv.fit <- fit.tmv(data = ghyp.data(ghyp.mv), control = list(abs.tol = 1e-3))
  ghyp.fit.info(mv.fit)



