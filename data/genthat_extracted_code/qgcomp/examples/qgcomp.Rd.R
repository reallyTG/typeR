library(qgcomp)


### Name: qgcomp
### Title: estimation of quantile g-computation fit
### Aliases: qgcomp
### Keywords: mixtures variance,

### ** Examples

set.seed(50)
dat <- data.frame(y=runif(50), x1=runif(50), x2=runif(50), z=runif(50))
qgcomp.noboot(y ~ z + x1 + x2, expnms = c('x1', 'x2'), data=dat, q=2)
qgcomp.boot(y ~ z + x1 + x2, expnms = c('x1', 'x2'), data=dat, q=2, B=10, seed=125)
# automatically selects appropriate method
qgcomp(y ~ z + x1 + x2, expnms = c('x1', 'x2'), data=dat, q=2)
# note for binary outcome this will 
dat <- data.frame(y=rbinom(50, 1, 0.5), x1=runif(50), x2=runif(50), z=runif(50))
qgcomp.noboot(y ~ z + x1 + x2, expnms = c('x1', 'x2'), data=dat, q=2, family=binomial())
qgcomp.boot(y ~ z + x1 + x2, expnms = c('x1', 'x2'), data=dat, q=2, B=10, seed=125, 
  family=binomial())
# automatically selects appropriate method
qgcomp(y ~ z + x1 + x2, expnms = c('x1', 'x2'), data=dat, q=2, family=binomial())
qgcomp(y ~ z + x1 + x2, expnms = c('x1', 'x2'), data=dat, q=2, family=binomial(), rr=TRUE)



