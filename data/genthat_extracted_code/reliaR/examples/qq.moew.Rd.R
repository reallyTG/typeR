library(reliaR)


### Name: qq.moew
### Title: Quantile versus quantile (QQ) plot for the Marshall-Olkin
###   Extended Weibull(MOEW) distribution
### Aliases: qq.moew
### Keywords: hplot

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## alpha.est = 0.3035937,  lambda.est = 279.2177754

qq.moew(sys2, 0.3035937, 279.2177754, main = " ", line.qt = FALSE)




