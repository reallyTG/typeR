library(spdep)


### Name: is.symmetric.nb
### Title: Test a neighbours list for symmetry
### Aliases: is.symmetric.nb sym.attr.nb make.sym.nb old.make.sym.nb
###   is.symmetric.glist
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
coords <- coordinates(columbus)
ind <- sapply(slot(columbus, "polygons"), function(x) slot(x, "ID"))
print(is.symmetric.nb(col.gal.nb, verbose=TRUE, force=TRUE))
k4 <- knn2nb(knearneigh(coords, k=4), row.names=ind)
k4 <- sym.attr.nb(k4)
print(is.symmetric.nb(k4))
k4.sym <- make.sym.nb(k4)
print(is.symmetric.nb(k4.sym))
}


