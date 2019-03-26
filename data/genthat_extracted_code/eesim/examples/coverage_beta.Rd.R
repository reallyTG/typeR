library(eesim)


### Name: coverage_beta
### Title: Empirical coverage of confidence intervals
### Aliases: coverage_beta

### ** Examples

sims <- create_sims(n_reps = 10, n = 600, central = 100,
                    sd = 10, exposure_type = "continuous",
                    exposure_trend = "cos1", exposure_slope=1,
                    exposure_amp = 0.6,
                    average_outcome = 20,
                    outcome_trend = "no trend",
                    rr = 1.01)
fits <- fit_mods(data = sims, custom_model = spline_mod,
                 custom_model_args = list(df_year = 1))
coverage_beta(df=fits, true_rr = 1.02)




