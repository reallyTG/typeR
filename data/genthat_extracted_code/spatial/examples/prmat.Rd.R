library(spatial)


### Name: prmat
### Title: Evaluate Kriging Surface over a Grid
### Aliases: prmat
### Keywords: spatial

### ** Examples

data(topo, package="MASS")
topo.kr <- surf.gls(2, expcov, topo, d=0.7)
prsurf <- prmat(topo.kr, 0, 6.5, 0, 6.5, 50)
contour(prsurf, levels=seq(700, 925, 25))



