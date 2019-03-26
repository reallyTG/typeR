library(reliaR)


### Name: pp.burrX
### Title: Probability versus Probability (PP) plot for the BurrX
###   distribution
### Aliases: pp.burrX
### Keywords: hplot

### ** Examples

## Load data sets
data(bearings)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.1989515, lambda.est = 0.0130847

pp.burrX(bearings, 1.1989515, 0.0130847, main = " ", line = TRUE)



