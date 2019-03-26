library(reliaR)


### Name: pp.exp.power
### Title: Probability versus Probability (PP) plot for the Exponential
###   Power distribution
### Aliases: pp.exp.power
### Keywords: hplot

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## alpha.est = 0.905868898, lambda.est =  0.001531423

pp.exp.power(sys2, 0.905868898, 0.001531423, main = '', line = TRUE)



