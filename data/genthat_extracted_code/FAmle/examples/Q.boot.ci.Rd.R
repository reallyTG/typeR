library(FAmle)


### Name: Q.boot.ci
### Title: Parametric Bootstrap Confidence Intervals for p-th Quantile
### Aliases: Q.boot.ci
### Keywords: models

### ** Examples

data(yarns)
x <- yarns$x
fit.x <- mle(x,'gamma',c(.1,.1))
Q.conf.int(p=c(.5,.9,.95,.99),model=fit.x,alpha=.01,ln=FALSE)
# should be run again with B = 1000, for example...
boot.x <- boot.mle(model=fit.x,B=50)
Q.boot.ci(p=c(.5,.9,.95,.99),boot=boot.x,alpha=.01)



