library(weibulltools)


### Name: ml_estimation
### Title: ML Estimation for Two-Parameter Lifetime Distributions
### Aliases: ml_estimation

### ** Examples

obs   <- seq(10000, 100000, 10000)
state <- c(0, 1, 1, 0, 0, 0, 1, 0, 1, 0)

mle <- ml_estimation(x = obs, event = state,
                     distribution = "weibull", conf_level = 0.90)




