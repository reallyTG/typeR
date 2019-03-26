library(reliaR)


### Name: abic.chen
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for a sample from Chen distribution
### Aliases: abic.chen
### Keywords: models

### ** Examples

## Load data sets

data(sys2)
## Maximum Likelihood(ML) Estimates of beta & lambda for the data(sys2)
## beta.est = 0.262282404, lambda.est = 0.007282371

## Values of AIC, BIC and LogLik for the data(sys2) 
abic.chen(sys2, 0.262282404, 0.007282371)



