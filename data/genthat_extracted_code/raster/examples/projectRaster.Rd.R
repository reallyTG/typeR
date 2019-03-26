library(raster)


### Name: projectRaster
### Title: Project a Raster object
### Aliases: projectRaster projectExtent
### Keywords: spatial

### ** Examples

# create a new (not projected) RasterLayer with cellnumbers as values
r <- raster(xmn=-110, xmx=-90, ymn=40, ymx=60, ncols=40, nrows=40)
r <- setValues(r, 1:ncell(r))
projection(r)
# proj.4 projection description
newproj <- "+proj=lcc +lat_1=48 +lat_2=33 +lon_0=-100 +ellps=WGS84"

# we need the rgdal package for this
if (require(rgdal)) {

#simplest approach
pr1 <- projectRaster(r, crs=newproj)

# alternatively also set the resolution
pr2 <- projectRaster(r, crs=newproj, res=20000)

# inverse projection, back to the properties of 'r'
inv <- projectRaster(pr2, r)

# to have more control, provide an existing Raster object, here we create one
# using projectExtent (no values are transferred)
pr3 <- projectExtent(r, newproj)
# Adjust the cell size 
res(pr3) <- 200000
# now project
pr3 <- projectRaster(r, pr3)

## Not run: 
##D # using a higher resolution
##D res(pr1) <- 10000
##D pr <- projectRaster(r, pr1, method='bilinear')
##D inv <- projectRaster(pr, r, method='bilinear')
##D dif <- r - inv
##D # small difference
##D plot(dif)
## End(Not run)

}



