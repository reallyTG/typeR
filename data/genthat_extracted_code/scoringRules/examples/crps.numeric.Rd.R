library(scoringRules)


### Name: crps.numeric
### Title: Continuous Ranked Probability Score for Parametric Forecast
###   Distributions
### Aliases: crps.numeric

### ** Examples

crps(y = 1, family = "normal", mean = 0, sd = 2)
crps(y = rnorm(20), family = "normal", mean = 1:20, sd = sqrt(1:20))

## Arguments can have different lengths:
crps(y = rnorm(20), family = "normal", mean = 0, sd = 2)
crps(y = 1, family = "normal", mean = 1:20, sd = sqrt(1:20))

## Mixture of normal distributions requires matrix input for parameters:
mval <- matrix(rnorm(20*50), nrow = 20)
sdval <- matrix(runif(20*50, min = 0, max = 2), nrow = 20)
weights <- matrix(rep(1/50, 20*50), nrow = 20)
crps(y = rnorm(20), family = "mixnorm", m = mval, s = sdval, w = weights)





