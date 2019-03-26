library(bayesCT)


### Name: historical_binomial
### Title: Historical data for binomial distribution
### Aliases: historical_binomial

### ** Examples

historical_binomial(y0_treatment = 5, N0_treatment = 10, y0_control = 15, N0_control = 23)
historical_binomial(y0_treatment = 5, N0_treatment = 10, y0_control = 15, N0_control = 23,
                     discount_function = "weibull", alpha_max = 1, fix_alpha = FALSE,
                     weibull_scale = 0.135, weibull_shape = 3)



