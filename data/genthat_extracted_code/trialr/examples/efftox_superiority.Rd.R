library(trialr)


### Name: efftox_superiority
### Title: Get dose-superiority matrix in EffTox
### Aliases: efftox_superiority

### ** Examples

dat <- efftox_parameters_demo()
dat$num_patients <- 3
dat$eff <- c(0, 1, 1)
dat$tox <- c(0, 0, 1)
dat$doses <- c(1, 2, 3)
fit <- rstan::sampling(stanmodels$EffTox, data = dat)
sup_mat <- efftox_superiority(fit)



