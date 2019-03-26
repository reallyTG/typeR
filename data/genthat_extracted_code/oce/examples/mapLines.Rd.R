library(oce)


### Name: mapLines
### Title: Add Lines to a Map
### Aliases: mapLines

### ** Examples

## Not run: 
##D library(oce)
##D data(coastlineWorld)
##D mapPlot(coastlineWorld, type='l',
##D         longitudelim=c(-80, 10), latitudelim=c(0, 120),
##D         projection="+proj=ortho +lon_0=-40")
##D lon <- c(-63.5744, 0.1062)             # Halifax CA to London UK
##D lat <- c(44.6479, 51.5171)
##D mapPoints(lon, lat, col='red')
##D mapLines(lon, lat, col='red')
## End(Not run)




