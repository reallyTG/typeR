library(brms)


### Name: bridge_sampler.brmsfit
### Title: Log Marginal Likelihood via Bridge Sampling
### Aliases: bridge_sampler.brmsfit bridge_sampler

### ** Examples

## Not run: 
##D # model with the treatment effect
##D fit1 <- brm(
##D   count ~ log_Age_c + log_Base4_c + Trt_c,
##D   data = epilepsy, family = negbinomial(), 
##D   prior = prior(normal(0, 1), class = b),
##D   save_all_pars = TRUE
##D )
##D summary(fit1)
##D bridge_sampler(fit1)
##D 
##D # model without the treatment effect
##D fit2 <- brm(
##D   count ~ log_Age_c + log_Base4_c,
##D   data = epilepsy, family = negbinomial(), 
##D   prior = prior(normal(0, 1), class = b),
##D   save_all_pars = TRUE
##D )
##D summary(fit2)
##D bridge_sampler(fit2)
## End(Not run)




