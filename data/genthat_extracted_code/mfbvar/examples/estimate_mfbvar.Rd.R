library(mfbvar)


### Name: estimate_mfbvar
### Title: Mixed-frequency Bayesian VAR
### Aliases: estimate_mfbvar

### ** Examples

prior_obj <- set_prior(Y = mf_sweden, freq = c(rep("m", 4), "q"),
                       n_lags = 4, n_burnin = 20, n_reps = 20)
mod_minn <- estimate_mfbvar(prior_obj, prior_type = "minn")



