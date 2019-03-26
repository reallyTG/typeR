library(gratia)


### Name: confint.gam
### Title: Point-wise and simultaneous confidence intervals for smooths
### Aliases: confint.gam confint.gamm

### ** Examples

library("mgcv")
set.seed(2)
dat <- gamSim(1, n = 400, dist = "normal", scale = 2)
mod <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat, method = "REML")
##'
## point-wise interval
ci <- confint(mod, parm = "x1", type = "confidence")
head(ci)
##'
## simultaneous interval for smooth term of x1
set.seed(42)
si <- confint(mod, parm = "x1", type = "simultaneous", nsim = 100)
head(si)



