library(brms)


### Name: loo.brmsfit
### Title: Compute the LOO information criterion
### Aliases: loo.brmsfit loo LOO LOO.brmsfit

### ** Examples

## Not run: 
##D # model with population-level effects only
##D fit1 <- brm(rating ~ treat + period + carry,
##D             data = inhaler, family = "gaussian")
##D loo(fit1)
##D 
##D # model with an additional varying intercept for subjects
##D fit2 <- brm(rating ~ treat + period + carry + (1|subject),
##D             data = inhaler, family = "gaussian")
##D # compare both models
##D loo(fit1, fit2)                          
## End(Not run)




