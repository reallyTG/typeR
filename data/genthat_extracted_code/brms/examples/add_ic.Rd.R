library(brms)


### Name: add_ic
### Title: Add information criteria and fit indices to fitted model objects
### Aliases: add_ic add_ic.brmsfit add_ic<- add_loo add_waic

### ** Examples

## Not run: 
##D fit <- brm(count ~ Trt, epilepsy, poisson())
##D # add both LOO and WAIC at once
##D fit <- add_ic(fit, ic = c("loo", "waic"))
##D print(fit$loo)
##D print(fit$waic)
## End(Not run)




