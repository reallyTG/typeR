library(brms)


### Name: loo_compare.brmsfit
### Title: Model comparison with the 'loo' package
### Aliases: loo_compare.brmsfit loo_compare

### ** Examples

## Not run: 
##D # model with population-level effects only
##D fit1 <- brm(rating ~ treat + period + carry,
##D             data = inhaler)
##D fit1 <- add_criterion(fit1, "waic")
##D 
##D # model with an additional varying intercept for subjects
##D fit2 <- brm(rating ~ treat + period + carry + (1|subject),
##D             data = inhaler)
##D fit2 <- add_criterion(fit2, "waic")
##D 
##D # compare both models
##D loo_compare(fit1, fit2, criterion = "waic")
## End(Not run)




