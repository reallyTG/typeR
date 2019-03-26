library(kernDeepStackNet)


### Name: lossGCV
### Title: Generalized cross-validation loss
### Aliases: lossGCV
### Keywords: models & regression

### ** Examples

# Simple example based on help pages of mgcv::gam
# GCV Score is the same as used in function mgcv::mgcv
library(mgcv)
dat <- gamSim(1, n=100, dist="normal", scale=2)
gamMod <- gam(y~s(x0)+s(x1)+s(x2)+s(x3),data=dat)
calcGCV <- lossGCV(n=100, Dev=deviance(gamMod), trA=sum(gamMod$edf), gammaPar=1)
all.equal(calcGCV, gamMod$gcv.ubre) # TRUE



