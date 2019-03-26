library(gratia)


### Name: appraise
### Title: Model diagnostic plots
### Aliases: appraise

### ** Examples

library(mgcv)
## Don't show: 
set.seed(2)
## End(Don't show)
## simulate some data...
dat <- gamSim(1, n = 400, dist = "normal", scale = 2)
mod <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat)
## run some basic model checks, including checking
## smoothing basis dimensions...
appraise(mod)



