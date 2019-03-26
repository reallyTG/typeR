library(gratia)


### Name: fderiv
### Title: First derivatives of fitted GAM functions
### Aliases: fderiv fderiv.gam fderiv.gamm

### ** Examples

library("mgcv")
## Don't show: 
set.seed(2)
## End(Don't show)
dat <- gamSim(1, n = 400, dist = "normal", scale = 2)
mod <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat, method = "REML")

## first derivatives of all smooths...
fd <- fderiv(mod)

## ...and a selected smooth
fd2 <- fderiv(mod, term = "x1")

## Models with factors
set.seed(2)
dat <- gamSim(4, n = 400, dist = "normal", scale = 2)
mod <- gam(y ~ s(x0) + s(x1) + fac, data = dat, method = "REML")

## first derivatives of all smooths...
fd <- fderiv(mod)

## ...and a selected smooth
fd2 <- fderiv(mod, term = "x1")



