library(spatial)


### Name: trmat
### Title: Evaluate Trend Surface over a Grid
### Aliases: trmat
### Keywords: spatial

### ** Examples

data(topo, package="MASS")
topo.kr <- surf.ls(2, topo)
trsurf <- trmat(topo.kr, 0, 6.5, 0, 6.5, 50)



