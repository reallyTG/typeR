library(qgcomp)


### Name: qgcomp.noboot
### Title: estimation of quantile g-computation fit (continuous outcome) or
###   conditional quantile odds ratio (binary outcome)
### Aliases: qgcomp.noboot
### Keywords: mixtures variance,

### ** Examples

set.seed(50)
dat <- data.frame(y=runif(50), x1=runif(50), x2=runif(50), z=runif(50))
qgcomp.noboot(f=y ~ z + x1 + x2, expnms = c('x1', 'x2'), data=dat, q=2)



