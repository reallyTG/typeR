library(mfbvar)


### Name: summary.mfbvar_ss
### Title: Summary method for class 'mfbvar_ss'
### Aliases: summary.mfbvar_ss

### ** Examples

prior_obj <- set_prior(Y = mf_sweden[, 4:5], d = "intercept",
                       freq = c("m", "q"), n_lags = 4, n_burnin = 20, n_reps = 20,
                       n_fcst = 4)

prior_intervals <- matrix(c(-0.1, 0.1,
                            0.4, 0.6), ncol = 2, byrow = TRUE)
psi_moments <- interval_to_moments(prior_intervals)
prior_psi_mean <- psi_moments$prior_psi_mean
prior_psi_Omega <- psi_moments$prior_psi_Omega
prior_obj <- update_prior(prior_obj,
                          prior_psi_mean = prior_psi_mean,
                          prior_psi_Omega = prior_psi_Omega)

mod_ss <- estimate_mfbvar(prior_obj, prior_type = "ss")
summary(mod_ss)




