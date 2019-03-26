library(gamlss.spatial)


### Name: gamlss.spatial-package
### Title: Spatial Terms in Generalized Additive Models for Location Scale
###   and Shape Models
### Aliases: gamlss.spatial-package gamlss.spatial
### Keywords: package

### ** Examples

library(mgcv)
data(columb)
data(columb.polys)
m1 <- MRFA(columb$crime, columb$district, polys=columb.polys)
draw.polys(columb.polys, m1) 



