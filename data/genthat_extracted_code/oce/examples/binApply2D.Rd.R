library(oce)


### Name: binApply2D
### Title: Apply a function to matrix data
### Aliases: binApply2D

### ** Examples

library(oce)
## Not run: 
##D ## secchi depths in lat and lon bins
##D if (require(ocedata)) {
##D     data(secchi, package="ocedata")
##D     col <- rev(oce.colorsJet(100))[rescale(secchi$depth,
##D                                            xlow=0, xhigh=20,
##D                                            rlow=1, rhigh=100)]
##D     zlim <- c(0, 20)
##D     breaksPalette <- seq(min(zlim), max(zlim), 1)
##D     colPalette <- rev(oce.colorsJet(length(breaksPalette)-1))
##D     drawPalette(zlim, "Secchi Depth", breaksPalette, colPalette)
##D     data(coastlineWorld)
##D     mapPlot(coastlineWorld, longitudelim=c(-5, 20), latitudelim=c(50, 66),
##D       grid=5, fill='gray', projection="+proj=lcc +lat_1=50 +lat_2=65")
##D     bc <- binApply2D(secchi$longitude, secchi$latitude,
##D                      pretty(secchi$longitude, 80),
##D                      pretty(secchi$latitude, 40),
##D                      f=secchi$depth, FUN=mean)
##D     mapImage(bc$xmids, bc$ymids, bc$result, zlim=zlim, col=colPalette)
##D     mapPolygon(coastlineWorld, col='gray')
##D }
## End(Not run)



