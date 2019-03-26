library(brms)


### Name: vcov.brmsfit
### Title: Covariance and Correlation Matrix of Population-Level Effects
### Aliases: vcov.brmsfit

### ** Examples

## Not run: 
##D fit <- brm(count ~ log_Age_c + log_Base4_c * Trt_c + (1+Trt_c|visit), 
##D            data = epilepsy, family = gaussian(), chains = 2)
##D vcov(fit)
## End(Not run)




