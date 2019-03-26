library(reliaR)


### Name: abic.gumbel
### Title: Akaike information criterion (AIC) and Bayesian information
###   criterion (BIC) for Gumbel distribution
### Aliases: abic.gumbel
### Keywords: models

### ** Examples

## Load data sets
data(dataset2)
## Maximum Likelihood(ML) Estimates of mu & sigma for the data(dataset2)
## Estimates of mu & sigma using 'maxLik' package
## mu.est = 212.157, sigma.est = 151.768

## Values of AIC, BIC and LogLik for the data(dataset2)
abic.gumbel(dataset2, 212.157, 151.768)



