library(reliaR)


### Name: qq.moee
### Title: Quantile versus quantile (QQ) plot for the Marshall-Olkin
###   Extended Exponential(MOEE) distribution
### Aliases: qq.moee
### Keywords: hplot

### ** Examples

## Load dataset
data(stress)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 75.67982, lambda.est = 1.67576

qq.moee(stress, 75.67982, 1.67576, main = '',line.qt = FALSE)



