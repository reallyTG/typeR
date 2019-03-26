library(spatial)


### Name: correlogram
### Title: Compute Spatial Correlograms
### Aliases: correlogram
### Keywords: spatial

### ** Examples

data(topo, package="MASS")
topo.kr <- surf.ls(2, topo)
correlogram(topo.kr, 25)
d <- seq(0, 7, 0.1)
lines(d, expcov(d, 0.7))



