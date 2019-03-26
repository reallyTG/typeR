library(circular)


### Name: curve.circular
### Title: Draw Function Plots in a Circle
### Aliases: curve.circular plot.function.circular
### Keywords: hplot

### ** Examples


ff <- function(x) sqrt(x)/20
curve.circular(ff)
curve.circular(ff, to=6*pi, join=FALSE, nosort=TRUE, n=1001, modulo="asis",
  shrink=1.2)

plot.function.circular(function(x) dvonmises(x, circular(0), 10), xlim=c(-1, 2.2))



