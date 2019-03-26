library(bsam)


### Name: diag_ssm
### Title: Plot standard McMC convergence diagnostics to help determine
###   lack of model convergence.
### Aliases: diag_ssm

### ** Examples

## Not run: 
##D data(ellie)
##D fit.s <- fit_ssm(ellie, model = "DCRWS", tstep = 1, adapt = 2000, samples = 1000, 
##D               thin = 2, span = 0.1)
##D diag_ssm(fit.s)
##D 
##D # increase burnin, posterior sample numbers, and thinning factor
##D fit.s2 <- fit_ssm(ellie, model = "DCRWS", tstep = 1, adapt = 5000, samples = 5000, 
##D               thin = 5, span = 0.1)
##D diag_ssm(fit.s2)
## End(Not run)             



