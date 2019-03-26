library(brms)


### Name: ranef.brmsfit
### Title: Extract Group-Level Estimates
### Aliases: ranef.brmsfit ranef

### ** Examples

## Not run: 
##D fit <- brm(count ~ log_Age_c + log_Base4_c * Trt_c + (1+Trt_c|visit), 
##D            data = epilepsy, family = gaussian(), chains = 2)
##D ranef(fit)
## End(Not run)




