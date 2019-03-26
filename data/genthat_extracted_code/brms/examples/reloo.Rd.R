library(brms)


### Name: reloo
### Title: Compute exact cross-validation for problematic observations
### Aliases: reloo reloo.loo

### ** Examples

## Not run: 
##D fit1 <- brm(count ~ log_Age_c + log_Base4_c * Trt + (1|patient),
##D            data = epilepsy, family = poisson())
##D # throws warning about some pareto k estimates being too high
##D (loo1 <- loo(fit1))
##D (loo1 <- reloo(loo1, fit1))
## End(Not run)




