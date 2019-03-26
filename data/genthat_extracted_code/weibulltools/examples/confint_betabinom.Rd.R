library(weibulltools)


### Name: confint_betabinom
### Title: Beta Binomial Confidence Bounds for Quantiles and/or
###   Probabilities
### Aliases: confint_betabinom

### ** Examples

obs   <- seq(10000, 100000, 10000)
state <- c(0, 1, 1, 0, 0, 0, 1, 0, 1, 0)

df_john <- johnson_method(x = obs, event = state)
mrr <- rank_regression(x = df_john$characteristic,
                       y = df_john$prob,
                       event = df_john$status,
                       distribution = "weibull",
                       conf_level = .95)
conf_betabin <- confint_betabinom(x = df_john$characteristic,
                                  event = df_john$status,
                                  loc_sc_params = mrr$loc_sc_coefficients,
                                  distribution = "weibull",
                                  bounds = "two_sided",
                                  conf_level = 0.95,
                                  direction = "y")



