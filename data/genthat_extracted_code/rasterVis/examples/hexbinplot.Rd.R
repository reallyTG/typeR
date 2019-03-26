library(rasterVis)


### Name: Formula methods
### Title: Formula methods
### Aliases: hexbinplot hexbinplot,formula,Raster-method
###   xyplot,formula,Raster-method
### Keywords: methods spatial

### ** Examples

f <- system.file("external/test.grd", package="raster")
r <- raster(f)
names(r)

xyplot(test~y, data=r, alpha=0.5)

## Not run: 
##D ##Solar irradiation data from CMSAF
##D ##Data available from http://www.box.net/shared/rl51y1t9sldxk54ogd44
##D 
##D old <- getwd()
##D ##change to your folder...
##D setwd('CMSAF')
##D listFich <- dir(pattern='2008')
##D stackSIS <- stack(listFich)SISmm <- SISmm*24 ##from irradiance (W/m2) to irradiation Wh/m2
##D setwd(old)
##D 
##D names(SISmm) <- month.abb
##D 
##D ##Relation between the January & February versus July radiation for four
##D ##differents longitude regions.
##D xyplot(Jan+Feb~Jul|cut(x, 4), data=SISmm, auto.key=list(space='right'))
##D ##Faster with hexbinplot
##D hexbinplot(Jan~Jul|cut(x, 6), data=SISmm)
## End(Not run)



