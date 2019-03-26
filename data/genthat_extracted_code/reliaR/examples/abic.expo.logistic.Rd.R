library(reliaR)


### Name: abic.expo.logistic
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for Exponentiated Logistic(EL) distribution
### Aliases: abic.expo.logistic
### Keywords: models

### ** Examples

## Load data sets
data(dataset2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(dataset2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 5.31302, beta.est = 139.04515

## Values of AIC, BIC and LogLik for the data(dataset2)
abic.expo.logistic(dataset2, 5.31302, 139.04515)



