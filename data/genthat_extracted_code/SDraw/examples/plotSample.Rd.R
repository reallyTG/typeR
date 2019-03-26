library(SDraw)


### Name: plotSample
### Title: Plot sample and frame
### Aliases: plotSample

### ** Examples

data(WY)
samp <- sdraw(WY, 100, type="HAL", J=c(4,3))
plotSample( samp, WY )
plotSample( samp, WY, lattice=TRUE )

# A map-like background under frame and sample ----
# Requires 'OpenStreetMap' package and internet connection
## Not run: 
##D library(OpenStreetMap)
##D # 1:convert to Lat-Long
##D WY.ll <- spTransform(WY, CRS("+init=epsg:4326"))
##D # 2:Specify bounding box for OpenStreetMap
##D bb.openmap <- bbox(WY.ll)
##D ULcoords <- c(bb.openmap[2,2], bb.openmap[1,1])
##D BRcoords <- c(bb.openmap[2,1], bb.openmap[1,2])
##D # 3:Fetch image (see 'openmap' help for 'type' parameter)
##D openMap <- OpenStreetMap::openmap(ULcoords, BRcoords, type = "esri")
##D # 4:Project background image to original coordinate system
##D openMap <- OpenStreetMap::openproj(openMap, projection = CRS(proj4string(WY))) 
##D # 5:plot background
##D plot(openMap)
##D # 6:plot frame and sample
##D plotSample(samp, WY, add=TRUE, poly.fill=FALSE)
## End(Not run)



