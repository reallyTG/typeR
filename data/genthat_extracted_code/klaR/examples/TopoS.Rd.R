library(klaR)


### Name: TopoS
### Title: Computation of criterion S of a visualization
### Aliases: TopoS
### Keywords: internal

### ** Examples

# Compute S for the MDS visualization of the german business data
data(B3)
plot(cmdscale(dist(B3[, 2:14])), col = rainbow(4)[B3[, 1]], pch = 16)
TopoS(dist(B3[, 2:14]), dist(cmdscale(dist(B3[, 2:14]))))



