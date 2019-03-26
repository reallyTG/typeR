library(trialr)


### Name: model_EffTox
### Title: Stan model for EffTox dose-finding design
### Aliases: model_EffTox EffTox

### ** Examples

# Get example parameters from Thall et al. 2014
dat <- efftox_parameters_demo()
# Add outcomes for three patients
dat$num_patients <- 3
dat$eff <- c(0, 1, 1)
dat$tox <- c(0, 0, 1)
dat$doses <- c(1, 2, 3)
# Fit the observed data to the model using rstan
fit <- rstan::sampling(stanmodels$EffTox, data = dat)
# The fit object is quite crude. Post-process to perform useful inference:
decision <- efftox_process(dat, fit)
decision$recommended_dose == 3
# Dose-level 3 is recommended for the next cohort of patients.



