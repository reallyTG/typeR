library(compositions)


### Name: biplot3D
### Title: Three-dimensional biplots, based on package rgl
### Aliases: biplot3D biplot3D.default biplot3D.princomp
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
pc <- princomp(acomp(sa.lognormals5))
pc
summary(pc)
plot(pc)           #plot(pc,type="screeplot")
biplot3D(pc)



