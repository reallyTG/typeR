library(mfbvar)


### Name: print.mfbvar_prior
### Title: Print method for mfbvar_prior
### Aliases: print.mfbvar_prior

### ** Examples

prior_obj <- set_prior(Y = mf_sweden, freq = c(rep("m", 4), "q"),
                       n_lags = 4, n_burnin = 100, n_reps = 100)
print(prior_obj)



