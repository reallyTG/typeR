library(trialr)


### Name: stan_crm
### Title: Fit a CRM model
### Aliases: stan_crm

### ** Examples

## Not run: 
##D # This model is presented in Thall et al. (2014)
##D mod1 <- stan_crm('1N 2N 3T', skeleton = c(0.1, 0.2, 0.35, 0.6),
##D                  target = 0.2, model = 'empiric', beta_sd = sqrt(1.34),
##D                  seed = 123)
##D 
##D # Shorthand for the above is:
##D mod2 <- stan_efftox_demo('1N 2E 3B', seed = 123)
##D 
##D # the seed is passed to the Stan sampler. The usual Stan sampler params like
##D # cores, iter, chains etc are passed on too via the ellipsis operator.
## End(Not run)



