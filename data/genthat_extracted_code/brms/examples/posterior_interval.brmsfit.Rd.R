library(brms)


### Name: posterior_interval.brmsfit
### Title: Compute posterior uncertainty intervals
### Aliases: posterior_interval.brmsfit posterior_interval

### ** Examples

## Not run: 
##D fit <- brm(count ~ log_Age_c + log_Base4_c * Trt_c,
##D            data = epilepsy, family = negbinomial())
##D posterior_interval(fit)
## End(Not run)




