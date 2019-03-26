library(reliaR)


### Name: abic.exp.power
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for a sample from Exponential Power(EP) distribution
### Aliases: abic.exp.power
### Keywords: models

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## alpha.est = 0.905868898, lambda.est =  0.001531423

## Values of AIC, BIC and LogLik for the data(sys2) 

abic.exp.power(sys2, 0.905868898, 0.001531423)



