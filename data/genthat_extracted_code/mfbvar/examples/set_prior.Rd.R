library(mfbvar)


### Name: set_prior
### Title: Set priors for an mfbvar model
### Aliases: set_prior update_prior check_prior

### ** Examples

prior_obj <- set_prior(Y = mf_sweden, freq = c(rep("m", 4), "q"),
                       n_lags = 4, n_burnin = 100, n_reps = 100)
prior_obj <- update_prior(prior_obj, n_fcst = 4)



