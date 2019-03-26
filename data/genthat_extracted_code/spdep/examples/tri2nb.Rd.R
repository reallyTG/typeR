library(spdep)


### Name: tri2nb
### Title: Neighbours list from tri object
### Aliases: tri2nb
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
coords <- coordinates(columbus)
ind <- sapply(slot(columbus, "polygons"), function(x) slot(x, "ID"))
col.tri.nb <- tri2nb(coords, row.names=ind)
W <- as(nb2listw(col.tri.nb, style="B"), "CsparseMatrix")
plot(columbus, border="grey")
plot(col.tri.nb, coords, add=TRUE)
title(main="Raw triangulation links")
x <- seq(0,1,0.1)
y <- seq(0,2,0.2)
xy <- expand.grid(x, y)
try(xy.nb <- tri2nb(xy))
seed <- 1234
xid <- sample(1:nrow(xy))
xy.nb <- tri2nb(xy[xid,])
plot(xy.nb, xy[xid,])
}


