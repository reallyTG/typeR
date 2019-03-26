library(spatial)


### Name: semat
### Title: Evaluate Kriging Standard Error of Prediction over a Grid
### Aliases: semat
### Keywords: spatial

### ** Examples

data(topo, package="MASS")
topo.kr <- surf.gls(2, expcov, topo, d=0.7)
prsurf <- prmat(topo.kr, 0, 6.5, 0, 6.5, 50)
contour(prsurf, levels=seq(700, 925, 25))
sesurf <- semat(topo.kr, 0, 6.5, 0, 6.5, 30)
contour(sesurf, levels=c(22,25))



