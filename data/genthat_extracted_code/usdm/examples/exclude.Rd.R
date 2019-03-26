library(usdm)


### Name: exclude
### Title: Excluding variables specified in a VIF object
### Aliases: exclude exclude,RasterStack,VIF-method
###   exclude,RasterBrick,VIF-method exclude,data.frame,VIF-method
###   exclude,matrix,VIF-method exclude,RasterStack,missing-method
###   exclude,RasterBrick,missing-method exclude,data.frame,missing-method
###   exclude,matrix,missing-method
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
##D re1 <- exclude(r,v1) # exclude the collinear variables that were identified in 
##D # the previous step
##D 
##D re1
##D 
##D v2 <- vifstep(r, th=10) # identify collinear variables that should be excluded
##D 
##D v2
##D 
##D re2 <- exclude(r, v2) # exclude the collinear variables that were identified in 
##D # the previous step
##D 
##D re2
##D 
##D re3 <- exclude(r) # first, vifstep is called 
##D 
##D 
##D re3
## End(Not run)



