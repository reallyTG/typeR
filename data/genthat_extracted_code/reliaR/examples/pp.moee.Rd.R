library(reliaR)


### Name: pp.moee
### Title: Probability versus Probability (PP) plot for the Marshall-Olkin
###   Extended Exponential(MOEE) distribution
### Aliases: pp.moee
### Keywords: hplot

### ** Examples

## Load dataset
data(stress)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 75.67982, lambda.est = 1.67576

pp.moee(stress, 75.67982, 1.67576, main = '', line = TRUE)



