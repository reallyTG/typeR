library(spdep)


### Name: nb.set.operations
### Title: Set operations on neighborhood objects
### Aliases: intersect.nb union.nb setdiff.nb complement.nb
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
coords <- coordinates(columbus)
col.tri.nb <- tri2nb(coords)
oldpar <- par(mfrow=c(1,2))
col.soi.nb <- graph2nb(soi.graph(col.tri.nb, coords))
plot(columbus, border="grey")
plot(col.soi.nb, coords, add=TRUE)
title(main="Sphere of Influence Graph")
plot(columbus, border="grey")
plot(complement.nb(col.soi.nb), coords, add=TRUE)
title(main="Complement of Sphere of Influence Graph")
par(mfrow=c(2,2))
col2 <- droplinks(col.gal.nb, 21)
plot(intersect.nb(col.gal.nb, col2), coords)
title(main="Intersect")
plot(union.nb(col.gal.nb, col2), coords)
title(main="Union")
plot(setdiff.nb(col.gal.nb, col2), coords)
title(main="Set diff")
par(oldpar)
}



