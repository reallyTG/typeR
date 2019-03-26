library(spdep)


### Name: knn2nb
### Title: Neighbours list from knn object
### Aliases: knn2nb
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
coords <- coordinates(columbus)
col.knn <- knearneigh(coords, k=4)
plot(columbus, border="grey")
plot(knn2nb(col.knn), coords, add=TRUE)
title(main="K nearest neighbours, k = 4")
}



