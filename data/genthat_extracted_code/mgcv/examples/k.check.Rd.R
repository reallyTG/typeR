library(mgcv)


### Name: k.check
### Title: Checking smooth basis dimension
### Aliases: k.check
### Keywords: models smooth regression

### ** Examples

library(mgcv)
set.seed(0)
dat <- gamSim(1,n=200)
b<-gam(y~s(x0)+s(x1)+s(x2)+s(x3),data=dat)
plot(b,pages=1)
k.check(b)



