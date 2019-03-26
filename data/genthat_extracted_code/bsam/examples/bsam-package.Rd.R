library(bsam)


### Name: bsam-package
### Title: Fit Bayesian state-space models to animal tracking data
### Aliases: bsam-package bsam
### Keywords: bsam

### ** Examples

## Not run: 
##D # Fit DCRW model for state filtering and regularization
##D data(ellie)
##D fit <- fit_ssm(ellie, model = "DCRW", tstep = 1, adapt = 5000, samples = 5000, 
##D               thin = 5, span = 0.2)
##D diag_ssm(fit)
##D map_ssm(fit)
##D plot_fit(fit)
## End(Not run)



