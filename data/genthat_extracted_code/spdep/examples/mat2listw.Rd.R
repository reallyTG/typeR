library(spdep)


### Name: mat2listw
### Title: Convert a square spatial weights matrix to a weights list object
### Aliases: mat2listw
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
coords <- coordinates(columbus)
col005 <- dnearneigh(coords, 0, 0.5, attr(col.gal.nb, "region.id"))
summary(col005)
col005.w.mat <- nb2mat(col005, zero.policy=TRUE)
col005.w.b <- mat2listw(col005.w.mat)
summary(col005.w.b$neighbours)
diffnb(col005, col005.w.b$neighbours)
col005.w.mat.3T <- kronecker(diag(3), col005.w.mat)
col005.w.b.3T <- mat2listw(col005.w.mat.3T, style="W")
summary(col005.w.b.3T$neighbours)
W <- as(nb2listw(col005, style="W", zero.policy=TRUE), "CsparseMatrix")
col005.spM <- mat2listw(W)
summary(col005.spM$neighbours)
diffnb(col005, col005.spM$neighbours)
IW <- kronecker(Diagonal(3), W)
col005.spM.3T <- mat2listw(IW, style="W")
summary(col005.spM.3T$neighbours)
}



