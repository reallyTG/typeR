library(NPCirc)


### Name: dragonfly
### Title: Orientations of dragonflies
### Aliases: dragonfly
### Keywords: datasets

### ** Examples

data(dragonfly)
x <- circular(dragonfly$orientation)
dens <- kern.den.circ(x)
plot(dens, shrink=1.3)



