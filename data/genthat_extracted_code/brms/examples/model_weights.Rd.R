library(brms)


### Name: model_weights.brmsfit
### Title: Model Weighting Methods
### Aliases: model_weights.brmsfit model_weights

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
##D # obtain Akaike weights based on the WAIC
##D model_weights(fit1, fit2, weights = "waic")
## End(Not run)




