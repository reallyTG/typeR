library(qgcomp)


### Name: quantize
### Title: create variables representing indicator functions with cutpoints
###   defined by quantiles
### Aliases: quantize
### Keywords: mixtures variance,

### ** Examples

set.seed(1232)
dat = data.frame(y=runif(100), x1=runif(100), x2=runif(100), z=runif(100))
qdata = quantize(data=dat, expnms=c("x1", "x2"), q=4)
table(qdata$data$x1)
table(qdata$data$x2)
summary(dat[c('y', 'z')]);summary(qdata$data[c('y', 'z')]) # not touched



