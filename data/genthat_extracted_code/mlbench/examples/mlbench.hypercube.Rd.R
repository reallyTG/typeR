library(mlbench)


### Name: mlbench.hypercube
### Title: Corners of Hypercube
### Aliases: mlbench.corners mlbench.hypercube hypercube
### Keywords: datagen

### ** Examples

p <- mlbench.hypercube()
plot(p)

library("lattice")
cloud(x.3~x.1+x.2, groups=classes, data=as.data.frame(p))



