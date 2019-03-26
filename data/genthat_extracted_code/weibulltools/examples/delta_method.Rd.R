library(weibulltools)


### Name: delta_method
### Title: Delta Method for Parametric Lifetime Distributions
### Aliases: delta_method

### ** Examples

obs   <- seq(10000, 100000, 10000)
state <- c(0, 1, 1, 0, 0, 0, 1, 0, 1, 0)

mle <- ml_estimation(x = obs, event = state,
                     distribution = "weibull", conf_level = 0.95)
delta_prob <- sapply(obs, delta_method,
                          loc_sc_params = mle$loc_sc_coefficients,
                          loc_sc_varcov = mle$loc_sc_vcov,
                          distribution = "weibull",
                          direction = "y")



