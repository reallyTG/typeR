library(gratia)


### Name: evaluate_smooth
### Title: Evaluate a smooth
### Aliases: evaluate_smooth evaluate_smooth.gam evaluate_smooth.gamm
###   evaluate_parametric_term evaluate_parametric_term.gam

### ** Examples

library("mgcv")
## Don't show: 
set.seed(2)
op <- options(cli.unicode = FALSE, digits = 6)
## End(Don't show)
dat <- gamSim(1, n = 400, dist = "normal", scale = 2)
m1 <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat, method = "REML")

evaluate_smooth(m1, "s(x1)")

## 2d example
set.seed(2)
dat <- gamSim(2, n = 1000, dist = "normal", scale = 1)
m2 <- gam(y ~ s(x, z, k = 30), data = dat$data, method = "REML")

evaluate_smooth(m2, "s(x,z)", n = 100)
## Don't show: 
options(op)
## End(Don't show)



