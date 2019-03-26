library(reliaR)


### Name: abic.logis.rayleigh
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for Logistic-Rayleigh(LR) distribution
### Aliases: abic.logis.rayleigh
### Keywords: models

### ** Examples

## Load data sets
data(stress)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(stress)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.4779388, lambda.est = 0.2141343

## Values of AIC, BIC and LogLik for the data(stress)
abic.logis.rayleigh(stress, 1.4779388, 0.2141343)



