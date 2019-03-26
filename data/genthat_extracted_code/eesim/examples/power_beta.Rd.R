library(eesim)


### Name: power_beta
### Title: Estimate power
### Aliases: power_beta

### ** Examples

sims <- create_sims(n_reps = 10, n = 600, central = 100,
                    sd = 10, exposure_type = "continuous",
                    exposure_trend = "cos1",
                    exposure_amp = 0.6,
                    average_outcome = 20,
                    outcome_trend = "no trend",
                    rr = 1.01)
fits <- fit_mods(data = sims, custom_model = spline_mod,
                 custom_model_args = list(df_year = 1))
power_beta(fits)




