library(gratia)


### Name: draw.evaluated_smooth
### Title: Plot estimated smooths
### Aliases: draw.evaluated_smooth draw.evaluated_1d_smooth
###   draw.evaluated_2d_smooth draw.evaluated_re_smooth
###   draw.evaluated_fs_smooth draw.evaluated_parametric_term

### ** Examples

library("mgcv")

## Don't show: 
set.seed(2)
## End(Don't show)
dat <- gamSim(1, n = 400, dist = "normal", scale = 2)
m1 <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat, method = "REML")

sm <- evaluate_smooth(m1, "s(x2)")
draw(sm)

## Don't show: 
set.seed(2)
## End(Don't show)
dat <- gamSim(2, n = 1000, dist = "normal", scale = 1)
m2 <- gam(y ~ s(x, z, k = 40), data = dat$data, method = "REML")

sm <- evaluate_smooth(m2, "s(x,z)", n = 100)
draw(sm)



