library(trialr)


### Name: trialr-package
### Title: Clinical Trial Designs in 'RStan'
### Aliases: trialr-package trialr
### Keywords: package clinical trial Bayesian stan rstan

### ** Examples

library(trialr)

# EffTox usage
dat <- efftox_parameters_demo()
# Add some outcomes
dat$num_patients <- 3
dat$eff <- c(0, 1, 1)
dat$tox <- c(0, 0, 1)
dat$doses <- c(1, 2, 3)
# Use rstan to obtain samples from the posterior distributions
samp <- rstan::sampling(stanmodels$EffTox, data = dat)
# Perform inference on posterior samples. E.g. posterior mean drug efficacy
colMeans(rstan::extract(samp, 'prob_eff')[[1]])

## Not run
## Hierarchical model for responses in a disease with multiple subtypes
# dat <- thallhierarchicalbinary_parameters_demo()
# samp <- rstan::sampling(stanmodels$ThallHierarchicalBinary, data = dat)
# rstan::plot(samp, pars = 'p')  # Plot the modelled response rates in the ten subtypes

## BEBOP in PePS2 usage
# set.seed(123)
# dat <- peps2_get_data(num_patients = 60,
#                      prob_eff = c(0.167, 0.192, 0.5, 0.091, 0.156, 0.439),
#                      prob_tox = rep(0.1, 6),
#                      eff_tox_or = rep(1, 6))
# samp <- rstan::sampling(stanmodels$BebopInPeps2, data = dat)
# decision <- peps2_process(dat, samp)
# decision$Accept   # Accept in cohort 2, 3, 5, 6 but not 1 or 4
# decision$ProbEff  # The probability of efficacy is driving that decision



