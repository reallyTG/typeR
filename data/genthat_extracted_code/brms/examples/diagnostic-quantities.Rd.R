library(brms)


### Name: log_posterior.brmsfit
### Title: Extract Diagnostic Quantities of 'brms' Models
### Aliases: log_posterior.brmsfit nuts_params.brmsfit rhat.brmsfit
###   neff_ratio.brmsfit diagnostic-quantities log_posterior nuts_params
###   rhat neff_ratio

### ** Examples

## Not run: 
##D fit <- brm(time ~ age * sex, data = kidney)
##D 
##D lp <- log_posterior(fit)
##D head(lp)
##D 
##D np <- nuts_params(fit)
##D str(np)
##D # extract the number of divergence transitions
##D sum(subset(np, Parameter == "divergent__")$Value)
##D 
##D head(rhat(fit))
##D head(neff_ratio(fit))
## End(Not run)



