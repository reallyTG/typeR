library(reliaR)


### Name: qq.burrX
### Title: Quantile versus quantile (QQ) plot for the BurrX distribution
### Aliases: qq.burrX
### Keywords: hplot

### ** Examples

## Load data sets
data(bearings)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.1989515, lambda.est = 0.0130847

qq.burrX(bearings, 1.1989515, 0.0130847, main = " ", line.qt = FALSE)



