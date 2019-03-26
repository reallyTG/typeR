library(reliaR)


### Name: abic.loglog
### Title: Akaike information criterion (AIC) and Bayesian/ Schwartz
###   information criterion (BIC)/ (SIC) for a sample from Loglog
###   distribution
### Aliases: abic.loglog
### Keywords: models

### ** Examples

## Load data set
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## alpha.est = 0.9058689 lambda.est = 1.0028228

## Values of AIC, BIC and LogLik for the data(sys2) 
abic.loglog(sys2, 0.9058689, 1.0028228)



