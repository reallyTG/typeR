library(insol)


### Name: slope
### Title: Slope of grid cells in a DEM
### Aliases: slope

### ** Examples

# Calculate the slope of a rough mountain area in the pyrinees
zipfile = tempfile()
download.file("https://meteoexploration.com/R/insol/data/dempyrenees.asc.zip",zipfile)
header = read.table(unz(zipfile,'dempyrenees.asc'),nrows=6)
dem = read.table(unz(zipfile,'dempyrenees.asc'),skip=6)
dem = as.matrix(dem)
unlink(zipfile)
cellsize = header[5,2]
slopedem = slope(cgrad(dem,cellsize),degrees=TRUE)
image(t(slopedem[nrow(slopedem):1,]),col=grey(100:1/100))


## similar but using raster
## Not run: 
##D require(rgdal)
##D require(raster)
##D demfile = tempfile()
##D download.file("https://meteoexploration.com/R/insol/data/dempyrenees.tif",demfile)
##D dem = raster(demfile)
##D slopedem = slope(cgrad(dem),degrees=TRUE)
##D slopedem = raster(slopedem,crs=projection(dem))
##D extent(slopedem) = extent(dem)
##D plot(slopedem,col = grey(100:1/100))
##D unlink(demfile)
## End(Not run)



