library(rasterVis)


### Name: Interaction
### Title: Interaction with trellis objects.
### Aliases: identifyRaster chooseRegion identifyRaster
###   identifyRaster,Raster-method
### Keywords: methods spatial

### ** Examples

f <- system.file("external/test.grd", package="raster")
r <- raster(f)
levelplot(r)
##Do not close the last graphical window
##Use the left button of the mouse to identify points and the right button to finish
chosen_r <- identifyRaster(r, values=TRUE)
chosen_r
s <- stack(r, r-500, r+500)
levelplot(s)
chosen_s <- identifyRaster(s, values=TRUE)
chosen_s

## Not run: 
##D ##The package mgcv is needed for the next example
##D ##Use the left button of the mouse to build a border with points, and the right button to finish.
##D ##The points enclosed by the border will be highlighted and returned as a SpatialPoints object.
##D levelplot(s)
##D reg <- chooseRegion()
##D summary(reg)
## End(Not run)

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
##D levelplot(SISmm)
##D 
##D ##Do not close the last graphical window
##D ##Interaction
##D ##Use the left button of the mouse to identify points and the right button to finish
##D chosen <- identifyRaster(SISmm, layer=3, values=TRUE)
##D chosen
##D ##Use the left button of the mouse to build a border with points, and the right button to finish.
##D ##The points enclosed by the border will be highlighted and returned as a SpatialPoints object.
##D reg <- chooseRegion()
##D summary(reg)
## End(Not run)



