library(spdep)


### Name: graphneigh
### Title: Graph based spatial weights
### Aliases: gabrielneigh relativeneigh soi.graph plot.Gabriel
###   plot.relative graph2nb
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
coords <- coordinates(columbus)
par(mfrow=c(2,2))
col.tri.nb<-tri2nb(coords)
col.gab.nb<-graph2nb(gabrielneigh(coords), sym=TRUE)
col.rel.nb<- graph2nb(relativeneigh(coords), sym=TRUE)
plot(columbus, border="grey")
plot(col.tri.nb,coords,add=TRUE)
title(main="Delaunay Triangulation")
plot(columbus, border="grey")
plot(col.gab.nb, coords, add=TRUE)
title(main="Gabriel Graph")
plot(columbus, border="grey")
plot(col.rel.nb, coords, add=TRUE)
title(main="Relative Neighbor Graph")
plot(columbus, border="grey")
if (require(rgeos, quietly=TRUE) && require(RANN, quietly=TRUE)) {
  col.soi.nb<- graph2nb(soi.graph(col.tri.nb,coords), sym=TRUE)
  plot(col.soi.nb, coords, add=TRUE)
  title(main="Sphere of Influence Graph")
}
par(mfrow=c(1,1))
dx <- rep(0.25*0:4,5)
dy <- c(rep(0,5),rep(0.25,5),rep(0.5,5), rep(0.75,5),rep(1,5))
m <- cbind(c(dx, dx, 3+dx, 3+dx), c(dy, 3+dy, dy, 3+dy))
try(res <- gabrielneigh(m))
res <- gabrielneigh(m, nnmult=4)
summary(graph2nb(res))
grd <- as.matrix(expand.grid(x=1:5, y=1:5)) #gridded data
r2 <- gabrielneigh(grd)
set.seed(1)
grd1 <- as.matrix(expand.grid(x=1:5, y=1:5)) + matrix(runif(50, .0001, .0006), nrow=25)
r3 <- gabrielneigh(grd1)
opar <- par(mfrow=c(1,2))
plot(r2, show=TRUE, linecol=2)
plot(r3, show=TRUE, linecol=2)
par(opar)
}



