library(eesim)


### Name: coverage_plot
### Title: Plot coverage of empirical confidence intervals
### Aliases: coverage_plot

### ** Examples

ex_sim <- eesim(n_reps = 100, n = 1000, central = 100, sd = 10,
          exposure_type = "continuous", average_outcome = 20, rr = 1.02,
          custom_model = spline_mod, custom_model_args = list(df_year = 1))
coverage_plot(ex_sim[[2]], true_param = 1.02)




