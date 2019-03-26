library(reliaR)


### Name: abic.lfr
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for linear failure rate(LFR) distribution
### Aliases: abic.lfr
### Keywords: models

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(sys2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 1.77773e-03,  beta.est = 2.77764e-06

## Values of AIC, BIC and LogLik for the data(sys2)
abic.lfr(sys2, 1.777673e-03, 2.777640e-06)



