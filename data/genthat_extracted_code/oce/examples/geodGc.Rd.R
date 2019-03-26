library(oce)


### Name: geodGc
### Title: Great-circle Segments Between Points on Earth
### Aliases: geodGc

### ** Examples

## Not run: 
##D library(oce)
##D data(coastlineWorld)
##D mapPlot(coastlineWorld, type='l',
##D         longitudelim=c(-80,10), latitudelim=c(35,80),
##D         projection="+proj=ortho", orientation=c(35, -35, 0))
##D ## Great circle from New York to Paris (Lindberg's flight)
##D l <- geodGc(c(-73.94,2.35), c(40.67,48.86), 1)
##D mapLines(l$longitude, l$latitude, col='red', lwd=2)
## End(Not run)




