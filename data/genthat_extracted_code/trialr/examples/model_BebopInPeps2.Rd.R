library(trialr)


### Name: model_BebopInPeps2
### Title: Stan model for BEBOP implementation in PePS2 clinical trial
### Aliases: model_BebopInPeps2 BebopInPeps2

### ** Examples

# Get model parameters as used in the PePS2 trial.
# This call randomly samples patient outcomes so set a seed
set.seed(123)
dat <- peps2_get_data(num_patients = 60,
                     prob_eff = c(0.167, 0.192, 0.5, 0.091, 0.156, 0.439),
                     prob_tox = rep(0.1, 6),
                     eff_tox_or = rep(1, 6))
# Fit the observed data to the model using rstan
samp <- rstan::sampling(stanmodels$BebopInPeps2, data = dat)
# The fit object is quite crude. Post-process to perform useful inference:
decision <- peps2_process(dat, samp)
decision$Accept   # Accept in cohort 2, 3, 5, 6 but not 1 or 4
decision$ProbEff  # The probability of efficacy is driving that decision



