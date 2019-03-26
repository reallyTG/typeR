library(eesim)


### Name: spline_mod
### Title: Fit a generalized linear model
### Aliases: spline_mod

### ** Examples

exp <- sim_exposure(n = 500, central = 100, sd = 10, trend = "cos1",
                    amp = .6, exposure_type = "continuous")
out <- sim_outcome(exposure = exp, average_outcome = 22, rr = 1.01)
spline_mod(df = out)




