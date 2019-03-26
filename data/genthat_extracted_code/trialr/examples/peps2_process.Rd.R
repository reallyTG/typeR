library(trialr)


### Name: peps2_process
### Title: Process RStan samples from a BEBOP model fit to PePS2 data
### Aliases: peps2_process

### ** Examples

set.seed(123)
dat <- peps2_get_data(num_patients = 60,
                      prob_eff = c(0.167, 0.192, 0.5,
                                   0.091, 0.156, 0.439),
                      prob_tox = rep(0.1, 6),
                      eff_tox_or = rep(1, 6))
samp = rstan::sampling(stanmodels$BebopInPeps2, data = dat)
decision <- peps2_process(dat, samp)
decision$Accept   # Accept in cohort 2, 3, 5, 6 but not 1, 4
decision$ProbEff  # The probability of efficacy is driving that decision




