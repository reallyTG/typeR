library(gratia)


### Name: draw.gam
### Title: Plot estimated smooths from a fitted GAM
### Aliases: draw.gam

### ** Examples

library("mgcv")

## Don't show: 
set.seed(2)
## End(Don't show)
dat <- gamSim(1, n = 400, dist = "normal", scale = 2)
m1 <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat, method = "REML")

draw(m1)



