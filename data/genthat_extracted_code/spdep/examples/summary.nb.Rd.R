library(spdep)


### Name: summary.nb
### Title: Print and summary function for neighbours and weights lists
### Aliases: summary.nb print.nb summary.listw print.listw
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
coords <- coordinates(columbus)
col.gal.nb
summary(col.gal.nb, coords)
col.listw <- nb2listw(col.gal.nb, style="W")
col.listw
summary(col.listw)
}


