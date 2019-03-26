library(gratia)


### Name: confint.fderiv
### Title: Point-wise and simultaneous confidence intervals for derivatives
###   of smooths
### Aliases: confint.fderiv

### ** Examples

library("mgcv")
## Don't show: 
set.seed(2)
op <- options(digits = 5)
## End(Don't show)
dat <- gamSim(1, n = 400, dist = "normal", scale = 2)
mod <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat, method = "REML")

## first derivatives of all smooths...
fd <- fderiv(mod)

## point-wise interval
ci <- confint(fd, type = "confidence")
head(ci)

## simultaneous interval for smooth term of x1
set.seed(42)
x1.sint <- confint(fd, parm = "x1", type = "simultaneous", nsim = 1000)
head(x1.sint)
## Don't show: 
options(op)
## End(Don't show)



