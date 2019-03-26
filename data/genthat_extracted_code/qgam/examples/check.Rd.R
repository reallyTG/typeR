library(qgam)


### Name: check
### Title: Generic checking function
### Aliases: check

### ** Examples

#######
# Using check.qgam
#######
library(qgam)
set.seed(0)
dat <- gamSim(1, n=200)
b<-qgam(y~s(x0)+s(x1)+s(x2)+s(x3), data=dat, qu = 0.5, 
        control = list("tol" = 0.01)) # <- semi-sloppy tolerance to speed-up calibration
plot(b, pages=1)
check(b, pch=19, cex=.3) 



