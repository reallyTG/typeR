library(reliaR)


### Name: abic.gompertz
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for Gompertz distribution
### Aliases: abic.gompertz
### Keywords: models

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & theta for the data(sys2)
## Estimates of alpha & theta using 'maxLik' package
## alpha.est = 0.00121307, theta.est = 0.00173329

## Values of AIC, BIC and LogLik for the data(sys2)
abic.gompertz(sys2, 0.00121307, 0.00173329)



