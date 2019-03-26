library(brms)


### Name: mi
### Title: Predictors with Missing Values in 'brms' Models
### Aliases: mi

### ** Examples

## Not run: 
##D data("nhanes", package = "mice")
##D bform <- bf(bmi | mi() ~ age * mi(chl)) +
##D   bf(chl | mi() ~ age) + set_rescor(FALSE)
##D fit <- brm(bform, data = nhanes)
##D summary(fit)
##D plot(marginal_effects(fit, resp = "bmi"), ask = FALSE)
##D LOO(fit, newdata = na.omit(fit$data))
## End(Not run) 




