library(rasterVis)


### Name: xyplot-methods
### Title: xyplot for Raster objects
### Aliases: xyplot xyplot,RasterStackBrick,missing-method
### Keywords: methods spatial

### ** Examples

## Not run: 
##D ##Solar irradiation data from CMSAF http://dx.doi.org/10.5676/EUM_SAF_CM/RAD_MVIRI/V001
##D old <- setwd(tempdir())
##D download.file('https://raw.github.com/oscarperpinan/spacetime-vis/master/data/SISmm2008_CMSAF.zip',
##D    'SISmm2008_CMSAF.zip', method='wget')
##D unzip('SISmm2008_CMSAF.zip')
##D 
##D listFich <- dir(pattern='\.nc')
##D stackSIS <- stack(listFich)
##D stackSIS <- stackSIS*24 ##from irradiance (W/m2) to irradiation Wh/m2
##D 
##D idx <- seq(as.Date('2008-01-15'), as.Date('2008-12-15'), 'month')
##D 
##D SISmm <- setZ(stackSIS, idx)
##D names(SISmm) <- month.abb
##D 
##D xyplot(SISmm)
## End(Not run)

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
##D xyplot(SST)
## End(Not run)




