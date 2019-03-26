library(weibulltools)


### Name: confint_fisher
### Title: Fisher Confidence Bounds for Quantiles and/or Probabilities
### Aliases: confint_fisher

### ** Examples

obs   <- seq(10000, 100000, 10000)
state <- c(0, 1, 1, 0, 0, 0, 1, 0, 1, 0)
df_john <- johnson_method(x = obs, event = state)
mle <- ml_estimation(x = obs, event = state,
                     distribution = "weibull", conf_level = 0.95)
conf_fish <- confint_fisher(x = df_john$characteristic,
                            event = df_john$status,
                            loc_sc_params = mle$loc_sc_coefficients,
                            loc_sc_varcov = mle$loc_sc_vcov,
                            distribution = "weibull",
                            bounds = "two_sided",
                            conf_level = 0.95,
                            direction = "y")



