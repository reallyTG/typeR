library(brms)


### Name: pairs.brmsfit
### Title: Create a matrix of output plots from a 'brmsfit' object
### Aliases: pairs.brmsfit

### ** Examples

## Not run: 
##D fit <- brm(count ~ log_Age_c + log_Base4_c * Trt_c 
##D            + (1|patient) + (1|visit), 
##D            data = epilepsy, family = "poisson")  
##D pairs(fit, pars = parnames(fit)[1:3], exact_match = TRUE)
##D pairs(fit, pars = "^sd_")
## End(Not run)




