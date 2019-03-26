library(trialr)


### Name: efftox_process
### Title: Process RStan samples from an EffTox model
### Aliases: efftox_process

### ** Examples

dat <- efftox_parameters_demo()
dat$num_patients <- 3
dat$eff <- c(0, 1, 1)
dat$tox <- c(0, 0, 1)
dat$doses <- c(1, 2, 3)
fit <- rstan::sampling(stanmodels$EffTox, data = dat)
decision <- efftox_process(dat, fit)
decision$recommended_dose == 3



