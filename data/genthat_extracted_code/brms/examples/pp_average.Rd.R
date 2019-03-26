library(brms)


### Name: pp_average.brmsfit
### Title: Posterior predictive samples averaged across models
### Aliases: pp_average.brmsfit pp_average

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
##D # compute model-averaged predicted values
##D (df <- unique(inhaler[, c("treat", "period", "carry")]))
##D pp_average(fit1, fit2, newdata = df)
##D 
##D # compute model-averaged fitted values
##D pp_average(fit1, fit2, method = "fitted", newdata = df)
## End(Not run)




