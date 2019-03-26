library(reliaR)


### Name: qq.flex.weibull
### Title: Quantile versus quantile (QQ) plot for the flexible Weibull(FW)
###   distribution
### Aliases: qq.flex.weibull
### Keywords: hplot

### ** Examples

## Load data sets
data(repairtimes)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(repairtimes)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 0.07077507, beta.est = 1.13181535

qq.flex.weibull(repairtimes, 0.07077507, 1.13181535, main = " ", line.qt = FALSE)



