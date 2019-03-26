library(trialr)


### Name: stan_efftox
### Title: Fit an EffTox model
### Aliases: stan_efftox

### ** Examples

## Not run: 
##D # This model is presented in Thall et al. (2014)
##D mod1 <- stan_efftox('1N 2E 3B',
##D                      real_doses = c(1.0, 2.0, 4.0, 6.6, 10.0),
##D                      efficacy_hurdle = 0.5, toxicity_hurdle = 0.3,
##D                      p_e = 0.1, p_t = 0.1,
##D                      eff0 = 0.5, tox1 = 0.65,
##D                      eff_star = 0.7, tox_star = 0.25,
##D                      alpha_mean = -7.9593, alpha_sd = 3.5487,
##D                      beta_mean = 1.5482, beta_sd = 3.5018,
##D                      gamma_mean = 0.7367, gamma_sd = 2.5423,
##D                      zeta_mean = 3.4181, zeta_sd = 2.4406,
##D                      eta_mean = 0, eta_sd = 0.2,
##D                      psi_mean = 0, psi_sd = 1, seed = 123)
##D 
##D # Shorthand for the above is:
##D mod2 <- stan_efftox_demo('1N 2E 3B', seed = 123)
##D 
##D # the seed is passed to the Stan sampler. The usual Stan sampler params like
##D # cores, iter, chains etc are passed on too via the ellipsis operator.
## End(Not run)



