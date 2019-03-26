library(reliaR)


### Name: abic.logis.exp
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for Logistic-Exponential(LE) distribution
### Aliases: abic.logis.exp
### Keywords: models

### ** Examples

## Load data sets
data(bearings)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 2.36754, lambda.est = 0.01059

## Values of AIC, BIC and LogLik for the data(bearings)
abic.logis.exp(bearings, 2.36754, 0.01059)



