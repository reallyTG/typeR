library(brms)


### Name: loo_model_weights.brmsfit
### Title: Model averaging via stacking or pseudo-BMA weighting.
### Aliases: loo_model_weights.brmsfit loo_model_weights

### ** Examples

## Not run: 
##D # model with population-level effects only
##D fit1 <- brm(rating ~ treat + period + carry,
##D             data = inhaler, family = "gaussian")
##D # model with an additional varying intercept for subjects
##D fit2 <- brm(rating ~ treat + period + carry + (1|subject),
##D             data = inhaler, family = "gaussian")
##D loo_model_weights(fit1, fit2)   
## End(Not run)  




