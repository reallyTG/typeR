library(mfbvar)


### Name: plot.mfbvar_minn
### Title: Plotting method for class 'mfbvar_minn'
### Aliases: plot.mfbvar_minn

### ** Examples

prior_obj <- set_prior(Y = mf_sweden[, 4:5], freq = c("m", "q"),
                       n_lags = 4, n_burnin = 20, n_reps = 20, n_fcst = 4)
mod_minn <- estimate_mfbvar(prior_obj, prior_type = "minn")
plot(mod_minn)



