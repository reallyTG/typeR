library(rasterVis)


### Name: horizonplot-methods
### Title: Horizon plots of Raster objects.
### Aliases: horizonplot horizonplot,RasterStackBrick-method
###   horizonplot,RasterStackBrick,missing-method
### Keywords: methods spatial

### ** Examples

## Not run: 
##D library(zoo)
##D 
##D url <- "ftp://ftp.wiley.com/public/sci_tech_med/spatio_temporal_data/"
##D sst.dat = read.table(paste(url, "SST011970_032003.dat", sep=''), header = FALSE) 
##D sst.ll = read.table(paste(url, "SSTlonlat.dat", sep=''), header = FALSE)
##D 
##D spSST <- SpatialPointsDataFrame(sst.ll, sst.dat)
##D gridded(spSST) <- TRUE
##D proj4string(spSST) = "+proj=longlat +datum=WGS84"
##D SST <- brick(spSST)
##D 
##D idx <- seq(as.Date('1970-01-01'), as.Date('2003-03-01'), by='month')
##D idx <- as.yearmon(idx)
##D SST <- setZ(SST, idx)
##D names(SST) <- as.character(idx)
##D 
##D horizonplot(SST)
##D 
##D horizonplot(SST, stat='sd')
##D 
##D ## Different scales for each panel, with colors representing deviations
##D ## from the origin in *that* panel
##D horizonplot(SST, scales=list('free'))
##D 
##D ## origin may be a function...
##D horizonplot(SST, origin=mean)
##D ## ...or a number
##D horizonplot(SST, origin=0)
##D 
##D ## A different color palette
##D horizonplot(SST, origin=0, col.regions=brewer.pal(n=6, 'PuOr'))
##D 
##D ## The width of each color segment can be defined with horizonscale
##D horizonplot(SST, horizonscale=1, origin=0)
## End(Not run)

## Not run: 
##D 
##D 
##D old <- getwd()
##D ##change to your folder...
##D setwd('CMSAF')
##D listFich <- dir(pattern='2008')
##D stackSIS <- stack(listFich)
##D stackSIS <- stackSIS*24 ##from irradiance (W/m2) to irradiation Wh/m2
##D setwd(old)
##D 
##D idx <- seq(as.Date('2008-01-15'), as.Date('2008-12-15'), 'month')
##D 
##D SISmm <- setZ(stackSIS, idx)
##D names(SISmm) <- month.abb
##D 
##D horizonplot(SISmm)
## End(Not run)





