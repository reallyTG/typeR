library(reliaR)


### Name: abic.moew
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for the Marshall-Olkin Extended Weibull(MOEW)
###   distribution
### Aliases: abic.moew
### Keywords: models

### ** Examples

## Load data set
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## alpha.est = 0.3035937,  lambda.est = 279.2177754

## Values of AIC, BIC and LogLik for the data(sys2) 
abic.moew(sys2, 0.3035937, 279.2177754)



