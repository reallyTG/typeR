library(trialr)


### Name: efftox_contour_plot
### Title: Plot EffTox utility contours
### Aliases: efftox_contour_plot

### ** Examples

dat <- efftox_parameters_demo()
efftox_contour_plot(dat)
# Add posterior beliefs
dat$num_patients <- 3
dat$eff <- c(0, 1, 1)
dat$tox <- c(0, 0, 1)
dat$doses <- c(1, 2, 3)
fit <- rstan::sampling(stanmodels$EffTox, data = dat)
decision <- efftox_process(dat, fit)
efftox_contour_plot(dat, prob_eff = decision$prob_eff,
                    prob_tox = decision$prob_tox)
title('EffTox utility contours')
# The same with ggplot2
efftox_contour_plot(dat, prob_eff = decision$prob_eff,
                    prob_tox = decision$prob_tox,
                    use_ggplot = TRUE) +
                    ggplot2::ggtitle('EffTox utility contours')




