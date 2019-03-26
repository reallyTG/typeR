library(eesim)


### Name: fit_mods
### Title: Fit a model to simulated datasets
### Aliases: fit_mods

### ** Examples

# Create a set of simulated datasets and then fit the model defined in `spline_mod` to
# all datasets, using the argument `df_year = 7` in the call to `spline_mod`. The `spline_mod`
# function is included in the `eesim` package and can be investigating by calling the function
# name without parentheses (i.e., `spline_mod`).
sims <- create_sims(n_reps = 10, n = 5 * 365, central = 100, sd = 10,
            exposure_type = "continuous", exposure_trend = "cos1",
            exposure_amp = .6, average_outcome = 22,
            outcome_trend = "no trend", outcome_amp = .6, rr = 1.01)
fit_mods(data = sims, custom_model = spline_mod, custom_model_args = list(df_year = 7))




