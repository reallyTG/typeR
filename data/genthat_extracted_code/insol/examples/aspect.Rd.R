library(insol)


### Name: aspect
### Title: Aspect or orientation of the slope
### Aliases: aspect

### ** Examples

# Create a west-east facing ramp
slpwe = rep(1,10)  %o% c(1:5,4:1)
# calculate the aspect at every node or grid cell (it should be 270 or 90 degrees):
cgr = cgrad(slpwe,1)
aspect(cgr,degrees=TRUE)

# Calculate the aspect of a rough mountain area in the pyrinees
zipfile = tempfile()
download.file("https://meteoexploration.com/R/insol/data/dempyrenees.asc.zip",zipfile)
header = read.table(unz(zipfile,'dempyrenees.asc'),nrows=6)
dem = read.table(unz(zipfile,'dempyrenees.asc'),skip=6)
dem = as.matrix(dem)
unlink(zipfile)
cellsize = header[5,2]
aspectdem = aspect(cgrad(dem,cellsize),degrees=TRUE)
image(t(aspectdem[nrow(aspectdem):1,]),col=grey(1:100/100))


## Not run: 
##D  ## raster package display nicer than image and handles projections:
##D require(rgdal)
##D require(raster)
##D demfile = tempfile()
##D download.file("https://meteoexploration.com/R/insol/data/dempyrenees.tif",demfile)
##D dem = raster(demfile)
##D aspectdem = aspect(cgrad(dem),degrees=TRUE)
##D aspectdem = raster(aspectdem,crs=projection(dem))
##D extent(aspectdem) = extent(dem)
##D plot(aspectdem,col=grey(1:100/100))
##D unlink(demfile)
## End(Not run)



