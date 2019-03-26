library(rasterVis)


### Name: splom-methods
### Title: Scatter plot matrices of Raster objects.
### Aliases: splom splom,RasterStackBrick,missing-method
### Keywords: methods spatial

### ** Examples

## Not run: 
##D ##Solar irradiation data from CMSAF
##D ##Data available from http://www.box.net/shared/rl51y1t9sldxk54ogd44
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
##D splom(SISmm)
## End(Not run)


