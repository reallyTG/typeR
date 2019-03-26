library(blavaan)


### Name: bgrowth
### Title: Fit Growth Curve Models
### Aliases: bgrowth

### ** Examples

## Not run: 
##D ## linear growth model with a time-varying covariate
##D model.syntax <- '
##D   # intercept and slope with fixed coefficients
##D     i =~ 1*t1 + 1*t2 + 1*t3 + 1*t4
##D     s =~ 0*t1 + 1*t2 + 2*t3 + 3*t4
##D 
##D   # regressions
##D     i ~ x1 + x2
##D     s ~ x1 + x2
##D 
##D   # time-varying covariates
##D     t1 ~ c1
##D     t2 ~ c2
##D     t3 ~ c3
##D     t4 ~ c4
##D '
##D 
##D fit <- bgrowth(model.syntax, data=Demo.growth)
##D summary(fit)
## End(Not run)



