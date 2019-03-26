library(prevalence)


### Name: betaExpert
### Title: Calculate the parameters of a Beta distribution based on expert
###   information
### Aliases: betaExpert print.betaExpert plot.betaExpert
### Keywords: Expert

### ** Examples

## Most likely value (mode) is 90%
## Expert states with 95% certainty that true value is larger than 70%
betaExpert(best = 0.90, lower = 0.70, p = 0.95)

## Most likely value (mode) is 0%
## Expert states with 95% certainty that true value is smaller than 40%
betaExpert(best = 0, upper = 0.40, p = 0.95)

## Most likely value (mode) is 80%
## Expert states with 90% certainty that true value lies in between 40% and 90%
betaExpert(best = 0.80, lower = 0.40, upper = 0.90, p = 0.90)

## Mean value is assumed to be 80%
## Expert states with 90% certainty that true value lies in between 40% and 90%
betaExpert(best = 0.80, lower = 0.40, upper = 0.90, p = 0.90, method = "mean")



