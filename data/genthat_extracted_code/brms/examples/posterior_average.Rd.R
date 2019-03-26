library(brms)


### Name: posterior_average.brmsfit
### Title: Posterior samples of parameters averaged across models
### Aliases: posterior_average.brmsfit posterior_average

### ** Examples

## Not run: 
##D # model with 'treat' as predictor
##D fit1 <- brm(rating ~ treat + period + carry, data = inhaler)
##D summary(fit1)
##D 
##D # model without 'treat' as predictor
##D fit2 <- brm(rating ~ period + carry, data = inhaler)
##D summary(fit2)
##D 
##D # compute model-averaged posteriors of overlapping parameters
##D posterior_average(fit1, fit2, weights = "waic")
## End(Not run)




