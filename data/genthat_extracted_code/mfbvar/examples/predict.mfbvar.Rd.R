library(mfbvar)


### Name: predict.mfbvar
### Title: Predict method for class 'mfbvar'
### Aliases: predict.mfbvar

### ** Examples

prior_obj <- set_prior(Y = mf_sweden[, 4:5], freq = c("m", "q"),
                       n_lags = 4, n_burnin = 20, n_reps = 20, n_fcst = 4)
mod_minn <- estimate_mfbvar(prior_obj, prior_type = "minn")
predict(mod_minn)
predict(mod_minn, pred_quantiles = 0.5, tidy = TRUE)



