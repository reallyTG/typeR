library(reliaR)


### Name: qq.gen.exp
### Title: Quantile versus quantile (QQ) plot for the Generalized
###   Exponential(GE) distribution
### Aliases: qq.gen.exp
### Keywords: hplot

### ** Examples

## Load data
data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 5.28321139, lambda.est = 0.03229609

qq.gen.exp(bearings, 5.28321139, 0.03229609, line.qt = FALSE)



