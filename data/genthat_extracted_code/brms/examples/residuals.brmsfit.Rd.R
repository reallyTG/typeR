library(brms)


### Name: residuals.brmsfit
### Title: Extract Model Residuals from brmsfit Objects
### Aliases: residuals.brmsfit predictive_error.brmsfit predictive_error

### ** Examples

## Not run: 
##D ## fit a model
##D fit <- brm(rating ~ treat + period + carry + (1|subject), 
##D            data = inhaler, cores = 2)
##D 
##D ## extract residuals 
##D res <- residuals(fit, summary = TRUE)
##D head(res)
## End(Not run)




