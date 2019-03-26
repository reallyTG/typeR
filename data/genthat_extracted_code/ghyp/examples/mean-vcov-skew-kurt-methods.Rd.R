library(ghyp)


### Name: mean-vcov-skew-kurt-methods
### Title: Expected value, variance-covariance, skewness and kurtosis of
###   generalized hyperbolic distributions
### Aliases: mean.ghyp mean-methods mean,ghyp-method vcov.ghyp vcov-methods
###   vcov,ghyp-method ghyp.skewness ghyp.kurtosis
### Keywords: utilities methods

### ** Examples

  ## Univariate: Parametric
  vg.dist <- VG(lambda = 1.1, mu = 10, sigma = 10, gamma = 2)
  mean(vg.dist)
  vcov(vg.dist)
  ghyp.skewness(vg.dist)
  ghyp.kurtosis(vg.dist)

  ## Univariate: Empirical
  vg.sim <- rghyp(10000, vg.dist)
  mean(vg.sim)
  var(vg.sim)

  ## Multivariate: Parametric
  vg.dist <- VG(lambda = 0.1, mu = c(55, 33), sigma = diag(c(22, 888)), gamma = 1:2)
  mean(vg.dist)
  vcov(vg.dist)

  ## Multivariate: Empirical
  vg.sim <- rghyp(50000, vg.dist)
  colMeans(vg.sim)
  var(vg.sim)



