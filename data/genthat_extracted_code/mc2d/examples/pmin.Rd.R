library(mc2d)


### Name: pmin
### Title: Maxima and Minima for mcnodes
### Aliases: pmin pmax pmin.default pmax.default pmin.mcnode pmax.mcnode
### Keywords: utilities

### ** Examples

ndvar(10);ndunc(21)
x <- mcstoc(rnorm, "V")
pmin(x, 0)
y <- mcdata(rep(c(-1, 1), length=ndunc()), "U")
unclass(pmin(x, y))








