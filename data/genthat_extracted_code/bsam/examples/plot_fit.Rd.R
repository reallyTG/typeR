library(bsam)


### Name: plot_fit
### Title: Plot the 1-D time-series of estimated location and behavioural
###   states
### Aliases: plot_fit

### ** Examples

## Not run: 
##D data(ellie)
##D fit.s <- fit_ssm(ellie, model = "DCRWS", tstep = 1, adapt = 2000, samples = 1000, 
##D               thin = 2, span = 0.1)
##D plot_fit(fit.s)
##D 
##D hfit.s <- fit_ssm(ellie, model = "hDCRWS", tstep = 1, adapt = 2000, samples = 1000, 
##D                 thin = 2, span = 0.1)
##D plot_fit(hfit.s)
## End(Not run)



