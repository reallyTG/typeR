library(trialr)


### Name: efftox_analysis_to_df
### Title: EffTox analysis to data.frame
### Aliases: efftox_analysis_to_df

### ** Examples

dat <- efftox_parameters_demo()
dat$num_patients <- 3
dat$eff <- c(0, 1, 1)
dat$tox <- c(0, 0, 1)
dat$doses <- c(1, 2, 3)
fit <- rstan::sampling(stanmodels$EffTox, data = dat)
decision <- efftox_process(dat, fit)
df <- efftox_analysis_to_df(decision)
round(df$Utility, 2) == c(-0.64, 0.04, 0.24, -0.05, -0.19)




