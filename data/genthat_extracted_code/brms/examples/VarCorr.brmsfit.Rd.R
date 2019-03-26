library(brms)


### Name: VarCorr.brmsfit
### Title: Extract Variance and Correlation Components
### Aliases: VarCorr.brmsfit VarCorr

### ** Examples

## Not run: 
##D fit <- brm(count ~ log_Age_c + log_Base4_c * Trt_c + (1+Trt_c|visit), 
##D            data = epilepsy, family = gaussian(), chains = 2)
##D VarCorr(fit)
## End(Not run)




