library(mfbvar)


### Name: summary.mfbvar_prior
### Title: Summary method for mfbvar_prior
### Aliases: summary.mfbvar_prior

### ** Examples

prior_obj <- set_prior(Y = mf_sweden, freq = c(rep("m", 4), "q"),
                       n_lags = 4, n_burnin = 100, n_reps = 100)
summary(prior_obj)



