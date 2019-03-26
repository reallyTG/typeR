library(gratia)


### Name: draw.derivatives
### Title: Plot derivatives of smooths
### Aliases: draw.derivatives

### ** Examples


library("mgcv")
## Don't show: 
set.seed(42)
## End(Don't show)
dat <- gamSim(1, n = 400, dist = "normal", scale = 2, verbose = FALSE)
mod <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat, method = "REML")

## first derivative of all smooths
df <- derivatives(mod)
draw(df)



