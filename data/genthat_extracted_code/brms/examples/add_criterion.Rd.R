library(brms)


### Name: add_criterion
### Title: Add model fit criteria to model objects
### Aliases: add_criterion add_criterion.brmsfit add_loo add_waic

### ** Examples

## Not run: 
##D fit <- brm(count ~ Trt, data = epilepsy)
##D # add both LOO and WAIC at once
##D fit <- add_criterion(fit, c("loo", "waic"))
##D print(fit$loo)
##D print(fit$waic)
## End(Not run)




