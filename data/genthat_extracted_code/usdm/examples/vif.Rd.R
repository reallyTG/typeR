library(usdm)


### Name: vif
### Title: Variance Inflation Factor and test for multicollinearity
### Aliases: vif vifcor vifstep vif,RasterStackBrick-method
###   vif,data.frame-method vif,matrix-method
###   vifcor,RasterStackBrick-method vifcor,data.frame-method
###   vifcor,matrix-method vifstep,RasterStackBrick-method
###   vifstep,data.frame-method vifstep,matrix-method
### Keywords: spatial

### ** Examples

## Not run: 
##D file <- system.file("external/spain.grd", package="usdm")
##D 
##D r <- brick(file) # reading a RasterBrick object including 10 raster layers in Spain
##D 
##D r 
##D 
##D vif(r) # calculates vif for the variables in r
##D 
##D v1 <- vifcor(r, th=0.9) # identify collinear variables that should be excluded
##D 
##D v1
##D 
##D v2 <- vifstep(r, th=10) # identify collinear variables that should be excluded
##D 
##D v2
## End(Not run)



