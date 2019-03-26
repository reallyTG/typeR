library(brms)


### Name: coef.brmsfit
### Title: Extract Model Coefficients
### Aliases: coef.brmsfit

### ** Examples

## Not run: 
##D fit <- brm(count ~ log_Age_c + log_Base4_c * Trt_c + (1+Trt_c|visit), 
##D            data = epilepsy, family = gaussian(), chains = 2)
##D ## extract population and group-level coefficients separately
##D fixef(fit)
##D ranef(fit)
##D ## extract combined coefficients 
##D coef(fit)
## End(Not run)




