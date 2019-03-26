library(mlbench)


### Name: mlbench.simplex
### Title: Corners of d-dimensional Simplex
### Aliases: mlbench.simplex simplex
### Keywords: datagen

### ** Examples

p <- mlbench.simplex()
plot(p)

library("lattice")
cloud(x.3~x.1+x.2, groups=classes, data=as.data.frame(p))



