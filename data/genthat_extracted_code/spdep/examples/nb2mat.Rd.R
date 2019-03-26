library(spdep)


### Name: nb2mat
### Title: Spatial weights matrices for neighbours lists
### Aliases: nb2mat listw2mat
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
coords <- coordinates(columbus)
col005 <- dnearneigh(coords, 0, 0.5, attr(col.gal.nb, "region.id"))
summary(col005)
col005.w.mat <- nb2mat(col005, zero.policy=TRUE)
table(round(apply(col005.w.mat, 1, sum)))
}


