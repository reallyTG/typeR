library(eesim)


### Name: check_sims
### Title: Assess model performance
### Aliases: check_sims

### ** Examples

sims <- create_sims(n_reps = 100, n = 1000, central = 100,
                    sd = 10, exposure_type = "continuous",
                    exposure_trend = "cos1",
                    exposure_amp = 0.6,
                    average_outcome = 20,
                    outcome_trend = "no trend",
                    rr = 1.02)
fits <- fit_mods(data = sims, custom_model = spline_mod,
                 custom_model_args = list(df_year = 1))
check_sims(df = fits, true_rr = 1.02)




