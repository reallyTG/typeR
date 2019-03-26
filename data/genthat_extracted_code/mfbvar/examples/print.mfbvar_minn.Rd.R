library(mfbvar)


### Name: print.mfbvar_minn
### Title: Printing method for class mfbvar_minn
### Aliases: print.mfbvar_minn

### ** Examples

prior_obj <- set_prior(Y = mf_sweden[, 4:5], freq = c("m", "q"),
                       n_lags = 4, n_burnin = 20, n_reps = 20)
mod_minn <- estimate_mfbvar(prior_obj, prior_type = "minn")
print(mod_minn)



