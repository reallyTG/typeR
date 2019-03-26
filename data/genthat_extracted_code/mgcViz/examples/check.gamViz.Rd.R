library(mgcViz)


### Name: check.gamViz
### Title: Some diagnostics for a fitted gam model
### Aliases: check.gamViz

### ** Examples

library(mgcViz)
set.seed(0)
dat <- gamSim(1, n = 200)
b <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat)
b <- getViz(b)

# Checks using default options
check(b)

# Change some algorithmic and graphical parameters
check(b,
      a.qq = list(method = "tnorm", 
                  a.cipoly = list(fill = "light blue")), 
      a.respoi = list(size = 0.2), 
      a.hist = list(bins = 10))



