library(rasterVis)


### Name: densityplot-methods
### Title: Density plots for Raster objects.
### Aliases: densityplot densityplot,RasterLayer,missing-method
###   densityplot,RasterStackBrick,missing-method
###   densityplot,formula,Raster-method
### Keywords: methods spatial

### ** Examples

f <- system.file("external/test.grd", package="raster")
r <- raster(f)
densityplot(r)
s <- stack(r, r+500, r-500)
densityplot(s)

## Not run: 
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
##D densityplot(SISmm)
##D ##FUN applies to z if not NULL
##D densityplot(SISmm, FUN=as.yearqtr)
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
##D densityplot(~asinh(pop)|landClass, data=s,
##D             scales=list(relation='free'),
##D             strip=strip.custom(strip.levels=TRUE))
## End(Not run)



