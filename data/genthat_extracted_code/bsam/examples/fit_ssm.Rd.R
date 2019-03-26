library(bsam)


### Name: fit_ssm
### Title: Fit Bayesian state-space models to animal movement data
### Aliases: fit_ssm

### ** Examples

## Not run: 
##D # Fit DCRW model for state filtering and regularization
##D data(ellie)
##D fit <- fit_ssm(ellie, model = "DCRW", tstep = 2, adapt = 5000, samples = 5000, 
##D               thin = 5, span = 0.2)
##D diag_ssm(fit)
##D map_ssm(fit)
##D plot_fit(fit)
##D result <- get_summary(fit)
##D 
##D # Fit DCRWS model for state filtering, regularization and behavioural state estimation
##D  fit.s <- fit_ssm(ellie, model = "DCRWS", tstep = 2, adapt = 5000, samples = 5000, 
##D                 thin = 5, span = 0.2)
##D  diag_ssm(fit.s)
##D  map_ssm(fit.s)
##D  plot_fit(fit.s)
##D  result.s <- get_summary(fit.s)
##D 
##D # fit hDCRWS model to > 1 tracks simultaneously
##D # this may provide better parameter and behavioural state estimation 
##D # by borrowing strength across multiple track datasets
##D  hfit.s <- fit_ssm(ellie, model = "hDCRWS", tstep = 2, adapt = 5000, samples = 5000, 
##D                 thin = 5, span = 0.2)
##D  diag_ssm(hfit.s)
##D  map_ssm(hfit.s)
##D  plot_fit(hfit.s)
##D  result.hs <- get_summary(hfit.s)
## End(Not run)



