library(reliaR)


### Name: abic.burrX
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for BurrX distribution
### Aliases: abic.burrX
### Keywords: models

### ** Examples

## Load data sets
data(bearings)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.1989515, lambda.est = 0.0130847

## Values of AIC, BIC and LogLik for the data(bearings)
abic.burrX(bearings, 1.1989515, 0.0130847)



