library(brms)


### Name: pp_check.brmsfit
### Title: Posterior Predictive Checks for 'brmsfit' Objects
### Aliases: pp_check.brmsfit pp_check

### ** Examples

## Not run: 
##D fit <-  brm(count ~ log_Age_c + log_Base4_c * Trt_c
##D             + (1|patient) + (1|obs),
##D             data = epilepsy, family = poisson())
##D 
##D pp_check(fit)  # shows dens_overlay plot by default
##D pp_check(fit, type = "error_hist", nsamples = 11)
##D pp_check(fit, type = "scatter_avg", nsamples = 100)
##D pp_check(fit, type = "stat_2d")
##D pp_check(fit, type = "rootogram")
##D pp_check(fit, type = "loo_pit")
##D 
##D ## get an overview of all valid types
##D pp_check(fit, type = "xyz")
## End(Not run)




