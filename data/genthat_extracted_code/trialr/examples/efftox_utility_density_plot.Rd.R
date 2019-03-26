library(trialr)


### Name: efftox_utility_density_plot
### Title: Plot densities of EffTox dose utilities
### Aliases: efftox_utility_density_plot

### ** Examples

dat <- efftox_parameters_demo()
dat$num_patients <- 3
dat$eff <- c(0, 1, 1)
dat$tox <- c(0, 0, 1)
dat$doses <- c(1, 2, 3)
fit <- rstan::sampling(stanmodels$EffTox, data = dat)
efftox_utility_density_plot(fit) + ggplot2::ggtitle('My doses')  # Too busy?
# Specify subset of doses to make plot less cluttered
efftox_utility_density_plot(fit, doses = 1:3) + ggplot2::ggtitle('My doses')




