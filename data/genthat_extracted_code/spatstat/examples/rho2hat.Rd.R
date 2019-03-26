library(spatstat)


### Name: rho2hat
### Title: Smoothed Relative Density of Pairs of Covariate Values
### Aliases: rho2hat
### Keywords: spatial models

### ** Examples

  data(bei)
  attach(bei.extra)
  plot(rho2hat(bei, elev, grad))
  fit <- ppm(bei, ~elev, covariates=bei.extra)
  ## Not run: 
##D   plot(rho2hat(fit, elev, grad))
##D   
## End(Not run)
  plot(rho2hat(fit, elev, grad, method="reweight"))



