library(reliaR)


### Name: qq.log.gamma
### Title: Quantile versus quantile (QQ) plot for the log-gamma(LG)
###   distribution
### Aliases: qq.log.gamma
### Keywords: hplot

### ** Examples

## Load data sets
data(conductors)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(conductors)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 0.0088741, lambda.est = 0.6059935

qq.log.gamma(conductors, 0.0088741, 0.6059935, main = " ", line.qt = FALSE)



