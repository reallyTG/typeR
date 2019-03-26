library(rasterList)


### Name: rasterList
### Title: Creates a 'RasterList-class' object
### Aliases: as.RasterList rasterList rasterList,RasterBrick-method
###   rasterList,RasterLayer-method rasterList,RasterList-method
###   rasterList,RasterStack-method

### ** Examples


f <- system.file("external/test.grd", package="raster")
rr <- rasterList(f) 
rs <- as.RasterList(f)
# The package-provided datasets shall be only used as example datasets. 
precf <- system.file("map/precipitation.grd", package="rasterList")##
## A resampled preciptation raster map based on CHIRS dataset:
## Funk, Chris, Pete Peterson, Martin Landsfeld, Diego Pedreros, James Verdin, 
## Shraddhanand Shukla, Gregory Husak, James Rowland, Laura Harrison, 
## Andrew Hoell and Joel Michaelsen.
## "The climate hazards infrared precipitation with stations - a new environmental 
## record for monitoring extremes". Scientific Data 2, 150066. doi:10.1038/sdata.2015.66 2015. 
## http://chg.geog.ucsb.edu/data/chirps/
##


## Sample L-moments
 library(lmom)
## Not run: 
##D prec <- stack(precf)
##D samlmom <- stack(rasterList(prec,FUN=samlmu))
##D ## Fitting a Random Probability Distribution: it is a 'rasterList' Object
##D fitdist <- rasterList(samlmom,FUN=pelgam)
## End(Not run)

precf <- system.file("map/Mekrou_precipitation.grd", package="rasterList")
prec <- stack(precf)
 # Set time
time <- as.Date(names(prec),format="X%Y.%m.%d")
year <- as.character(time,format="X%Y")

## Compute Annual Precipitation (sum aggregration)
yearlyprec <- stackApply(x=prec,fun=sum,indices=year)
## L-moments
samlmom <- stack(rasterList(yearlyprec,FUN=samlmu))
fitdist <- rasterList(samlmom,FUN=pelgam)





