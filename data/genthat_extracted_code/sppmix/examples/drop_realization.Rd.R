library(sppmix)


### Name: drop_realization
### Title: Drop MCMC realizations
### Aliases: drop_realization

### ** Examples

## No test: 
fit <- est_mix_bdmcmc(spatstat::redwood, m = 5)
fit
drop_realization(fit, 500)
drop_realization(fit, fit$numcomp != 5)
## End(No test)




