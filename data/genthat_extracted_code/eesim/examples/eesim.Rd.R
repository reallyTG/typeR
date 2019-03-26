library(eesim)


### Name: eesim
### Title: Simulate data, fit models, and assess models
### Aliases: eesim

### ** Examples

# Run a simulation for a continuous exposure (mean = 100, standard
# deviation after long-term and seasonal trends = 10) that increases
# risk of a count outcome by 0.1% per unit increase, where the average
# daily outcome is 22 per day. The exposure outcome has a seasonal trend,
# with higher values in the winter, while the outcome has no seasonal
# or long-term trends beyond those introduced through effects from the
# exposure. The simulated data are fit with a model defined by the `spline_mod`
# function (also in the `eesim` package), with its `df_year` argument set to 7.

sims <- eesim(n_reps = 3, n = 5 * 365, central = 100, sd = 10,
      exposure_type = "continuous", exposure_trend = "cos3",
      exposure_amp = .6, average_outcome = 22, rr = 1.001,
      custom_model = spline_mod, custom_model_args = list(df_year = 7))
names(sims)
sims[[2]]
sims[[3]]




