library(qgam)


### Name: check.qgam
### Title: Some diagnostics for a fitted qgam model
### Aliases: check.qgam

### ** Examples

library(qgam)
set.seed(0)
dat <- gamSim(1, n=200)
b<-qgam(y~s(x0)+s(x1)+s(x2)+s(x3), data=dat, qu = 0.5)
plot(b, pages=1)
check.qgam(b, pch=19, cex=.3)




