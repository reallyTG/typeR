library(mgcv)


### Name: gaulss
### Title: Gaussian location-scale model family
### Aliases: gaulss
### Keywords: models regression

### ** Examples

library(mgcv);library(MASS)
b <- gam(list(accel~s(times,k=20,bs="ad"),~s(times)),
            data=mcycle,family=gaulss())
summary(b) 
plot(b,pages=1,scale=0)



