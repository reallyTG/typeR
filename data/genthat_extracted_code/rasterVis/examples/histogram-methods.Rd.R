library(rasterVis)


### Name: histogram-methods
### Title: Histogram of Raster objects.
### Aliases: histogram histogram,RasterLayer,missing-method
###   histogram,RasterStackBrick,missing-method
###   histogram,formula,Raster-method
### Keywords: methods spatial

### ** Examples

f <- system.file("external/test.grd", package="raster")
r <- raster(f)
histogram(r)
s <- stack(r, r+500, r-500)
## Same breakpoints across panels
histogram(s)
## Each panel with different breakpoints
histogram(s, breaks=NULL)
histogram(s, breaks='Sturges')
histogram(s, breaks=30)


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
##D histogram(SISmm)
##D histogram(SISmm, FUN=as.yearqtr)
##D 
##D ## With the formula interface you can create histograms for a set of variables
##D histogram(~ Jan + Dec, data=SISmm)
##D ## Or use the coordinates for generating zonal histograms.
##D ## For example, five histograms for each latitude zone  
##D histogram(~Jan|cut(y, 5), data=SISmm)
##D ## More sophisticated bands can be defined using the dirXY argument 
##D histogram(~Jan|cut(dirXY, 5), dirXY = x^2 + y^2, data=SISmm)
##D  
##D setwd(old)
## End(Not run)

## Not run: 
##D ##http://neo.sci.gsfc.nasa.gov/Search.html?group=64
##D pop <- raster('875430rgb-167772161.0.FLOAT.TIFF')
##D pop[pop==99999] <- NA
##D levelplot(pop, zscaleLog=10, par.settings=BTCTheme,
##D           panel=panel.levelplot.raster, interpolate=TRUE)
##D 
##D ##http://neo.sci.gsfc.nasa.gov/Search.html?group=20
##D landClass <- raster('241243rgb-167772161.0.TIFF')
##D landClass[landClass==254] <- NA
##D 
##D 
##D s <- stack(pop, landClass)
##D names(s) <- c('pop', 'landClass')
##D 
##D histogram(~asinh(pop)|landClass, data=s,
##D             scales=list(relation='free'),
##D             strip=strip.custom(strip.levels=TRUE))
## End(Not run)




