library(mixtox)


### Name: getCI
### Title: Calculating Confidence Intervals
### Aliases: getCI
### Keywords: non-simultanous confidence intervals non-simultanous
###   prediction intervals

### ** Examples

## example 1
x <- cytotox$Ni$x
rspn <- cytotox$Ni$y
obj <- curveFit(x, rspn, eq = 'Logit', param = c(12, 3), effv = c(0.05, 0.5), rtype = 'quantal')
getCI(obj, effv = c(0.05, 0.50))



