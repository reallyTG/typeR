library(BBMM)


### Name: bbmm.contour
### Title: Create density contours from a Brownian bridge movement model
### Aliases: bbmm.contour
### Keywords: ~contour ~Ascii

### ** Examples

data(locations)
BBMM <- brownian.bridge(x=locations$x, y=locations$y, 
            time.lag=locations$time.lag[-1], location.error=20, 
            cell.size=50)
contours <- bbmm.contour(BBMM, levels=c(95, 99), locations=locations, plot=TRUE)

# Create a shapefile with contour lines
# Not run: library(maptools)
# Not run: library(raster)
# Not run: out <- data.frame(x=BBMM$x,y=BBMM$y,z=BBMM$probability)
# Make sure the data is properly projected
# Not run: out.raster <- rasterFromXYZ(out,crs=CRS("+proj=utm +zone=12 +datum=WGS84"),digits=2) 
# Not run: raster.contour <- rasterToContour(out.raster,levels=contours$Z) 
# Not run: raster.contour <- spChFIDs(raster.contour,paste(c(95, 99),"% Contour Line",sep="")) 
# Not run: library(rgdal) # can't be loaded before CRS call in line above
# Not run: writeOGR(obj=raster.contour,dsn=".",layer="BBMM",driver="ESRI Shapefile")




