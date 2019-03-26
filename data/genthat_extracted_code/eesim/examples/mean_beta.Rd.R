library(eesim)


### Name: mean_beta
### Title: Average Estimated Coefficient
### Aliases: mean_beta

### ** Examples

sims <- create_sims(n_reps=10, n=50, central = 100, sd = 10,
            exposure_type="continuous", exposure_trend = "cos1",
            exposure_amp = .6, average_outcome = 22,
            outcome_trend = "no trend", outcome_amp = .6, rr = 1.01)
fits <- fit_mods(data = sims, custom_model = spline_mod,
                 custom_model_args = list(df_year = 1))
mean_beta(df=fits)




