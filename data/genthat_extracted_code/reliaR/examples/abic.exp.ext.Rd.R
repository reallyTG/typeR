library(reliaR)


### Name: abic.exp.ext
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for Exponential Extension(EE) distribution
### Aliases: abic.exp.ext
### Keywords: models

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.0126e+01, lambda.est = 1.5848e-04

## Values of AIC, BIC and LogLik for the data(sys2)
abic.exp.ext(sys2, 1.0126e+01, 1.5848e-04)



