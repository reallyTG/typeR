library(gratia)


### Name: derivatives
### Title: Derivatives of estimated smooths via finite differences
### Aliases: derivatives derivatives.default derivatives.gamm
###   derivatives.gam

### ** Examples


library("mgcv")
## Don't show: 
set.seed(42)
op <- options(cli.unicode = FALSE)
## End(Don't show)
dat <- gamSim(1, n = 400, dist = "normal", scale = 2, verbose = FALSE)
mod <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat, method = "REML")

## first derivative of all smooths using central finite differenc
derivatives(mod, type = "central")
## Don't show: 
options(op)
## End(Don't show)



