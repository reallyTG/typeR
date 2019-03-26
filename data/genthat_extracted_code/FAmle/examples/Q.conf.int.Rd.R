library(FAmle)


### Name: Q.conf.int
### Title: Approximate Confidence Intervals for p-th Quantile
### Aliases: Q.conf.int
### Keywords: models

### ** Examples

data(yarns)
x <- yarns$x
fit.x <- mle(x,'gamma',c(.1,.1))
Q.conf.int(p=c(.5,.9,.95,.99),model=fit.x,alpha=.01,ln=FALSE)
Q.conf.int(p=c(.5,.9,.95,.99),model=fit.x,alpha=.01,ln=TRUE)



