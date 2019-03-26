library(qgcomp)


### Name: print.qgcompfit
### Title: default printing method for a qgcompfit object
### Aliases: print.qgcompfit
### Keywords: mixtures variance,

### ** Examples

set.seed(50)
dat <- data.frame(y=runif(50), x1=runif(50), x2=runif(50), z=runif(50))
obj1 <- qgcomp.noboot(y ~ z + x1 + x2, expnms = c('x1', 'x2'), data=dat, q=2)
obj2 <- qgcomp.boot(y ~ z + x1 + x2, expnms = c('x1', 'x2'), data=dat, q=2, B=10, seed=125)
# does not need to be explicitly called, but included here for clarity
print(obj1)
print(obj2)



