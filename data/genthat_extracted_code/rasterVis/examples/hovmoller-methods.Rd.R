library(rasterVis)


### Name: hovmoller-methods
### Title: Hovmoller plots
### Aliases: hovmoller hovmoller,RasterStackBrick-method
### Keywords: methods spatial methods

### ** Examples

## Not run: 
##D ##Solar irradiation data from CMSAF http://dx.doi.org/10.5676/EUM_SAF_CM/RAD_MVIRI/V001
##D old <- setwd(tempdir())
##D download.file('https://raw.github.com/oscarperpinan/spacetime-vis/master/data/SISmm2008_CMSAF.zip',
##D    'SISmm2008_CMSAF.zip', method='wget')
##D unzip('SISmm2008_CMSAF.zip')
##D 
##D listFich <- dir(pattern='\\.nc')
##D stackSIS <- stack(listFich)
##D stackSIS <- stackSIS*24 ##from irradiance (W/m2) to irradiation Wh/m2
##D 
##D idx <- seq(as.Date('2008-01-15'), as.Date('2008-12-15'), 'month')
##D 
##D SISmm <- setZ(stackSIS, idx)
##D names(SISmm) <- month.abb
##D 
##D ## Latitude as default
##D hovmoller(SISmm, xlab='Latitude')
##D 
##D ## With contour lines and labels
##D hovmoller(SISmm, labels=TRUE, add.contour=TRUE,
##D           xlab='Latitude')
##D 
##D ## Smooth color regions with latticeExtra::panel.2dsmoother
##D hovmoller(SISmm, panel=panel.2dsmoother, n=1000,
##D           labels=FALSE, add.contour=TRUE,
##D           xlab='Latitude')
##D 
##D ## Using a function of coordinates
##D hovmoller(SISmm, dirXY=sqrt(x^2+y^2))
## End(Not run)

## Not run: 
##D library(zoo)
##D library(rasterVis)
##D 
##D ## DESCRIPTION: http://iridl.ldeo.columbia.edu/SOURCES/.CAC/.sst/
##D setwd(tempdir())
##D download.file('http://iridl.ldeo.columbia.edu/SOURCES/.CAC/.sst/data.nc', destfile = 'SST.nc')
##D SST <- stack('SST.nc')
##D idx <- seq(as.Date('1970-01-01'), as.Date('2003-03-01'), by='month')
##D tt <- as.yearmon(idx)
##D SST <- setZ(SST, tt)
##D names(SST) <- as.character(tt)
##D 
##D ## Extract month value from a Date or yearmon object
##D month <- function(x)format(x, '%m')
##D ## Compute anomaly using monthly grouping with ave  
##D anomaly <- function(x){
##D     ## Monthly means
##D     mm <- ave(x, month(tt), FUN = mean)
##D     ## Monthly standard deviation
##D     msd <- ave(x, month(tt), FUN = sd)
##D     ## anomaly
##D     (x - mm)/msd
##D }
##D ## Use anomaly with calc
##D SSTanom <- calc(SST, anomaly)
##D SSTanom <- setZ(SSTanom, tt)
##D 
##D ## Ok, let's see the result
##D hovmoller(SSTanom,
##D           at = seq(-3, 3, .25),
##D           panel = panel.levelplot.raster,
##D           interpolate = TRUE,
##D           yscale.components = yscale.raster.subticks,
##D           par.settings = BuRdTheme)
## End(Not run)



