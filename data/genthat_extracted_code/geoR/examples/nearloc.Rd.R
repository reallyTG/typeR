library(geoR)


### Name: nearloc
### Title: Near location to a point
### Aliases: nearloc
### Keywords: spatial

### ** Examples

set.seed(276)
gr <- expand.grid(seq(0,1, l=11), seq(0,1, l=11))
plot(gr, asp=1)
pts <- matrix(runif(10), nc=2)
points(pts, pch=19)
near <- nearloc(points=pts, locations=gr)
points(near, pch=19, col=2)
rownames(near)
nearloc(points=pts, locations=gr, pos=TRUE)



