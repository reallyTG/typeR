library(mgcv)


### Name: gam.check
### Title: Some diagnostics for a fitted gam model
### Aliases: gam.check
### Keywords: models smooth regression

### ** Examples

library(mgcv)
set.seed(0)
dat <- gamSim(1,n=200)
b<-gam(y~s(x0)+s(x1)+s(x2)+s(x3),data=dat)
plot(b,pages=1)
gam.check(b,pch=19,cex=.3)



