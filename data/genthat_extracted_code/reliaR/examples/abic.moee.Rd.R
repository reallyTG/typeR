library(reliaR)


### Name: abic.moee
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for the Marshall-Olkin Extended Exponential(MOEE)
###   distribution
### Aliases: abic.moee
### Keywords: models

### ** Examples

## Load data set
data(stress)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 75.67982, lambda.est = 1.67576
abic.moee(stress, 75.67982, 1.67576)



