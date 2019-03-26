library(trialr)


### Name: peps2_get_data
### Title: Get data to run the PePS2 trial example
### Aliases: peps2_get_data

### ** Examples

set.seed(123)
dat <- peps2_get_data(num_patients = 60,
                      prob_eff = c(0.167, 0.192, 0.5, 0.091, 0.156, 0.439),
                      prob_tox = rep(0.1, 6),
                      eff_tox_or = rep(1, 6))
samp = rstan::sampling(stanmodels$BebopInPeps2, data = dat)




