library(qgcomp)


### Name: predict.qgcompfit
### Title: predict.qgcompfit: default prediction method for a qgcompfit
###   object
### Aliases: predict.qgcompfit

### ** Examples

set.seed(50)
dat <- data.frame(y=runif(50), x1=runif(50), x2=runif(50), z=runif(50))
obj1 <- qgcomp.noboot(y ~ z + x1 + x2, expnms = c('x1', 'x2'), data=dat, q=2)
obj2 <- qgcomp.boot(y ~ z + x1 + x2, expnms = c('x1', 'x2'), data=dat, q=2, B=10, seed=125)
set.seed(52)
dat2 <- data.frame(y=runif(50), x1=runif(50), x2=runif(50), z=runif(50))
summary(predict(obj1, expnms = c('x1', 'x2'), newdata=dat2))
summary(predict(obj2, expnms = c('x1', 'x2'), newdata=dat2))



