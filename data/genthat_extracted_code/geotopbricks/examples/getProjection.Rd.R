library(geotopbricks)


### Name: getProjection
### Title: It reads the CRS metadata utilzed in a GEOtop Simulation
### Aliases: getProjection

### ** Examples

library(geotopbricks)
wpath <- "http://www.rendena100.eu/public/geotopbricks/simulations/idroclim_test1"
x <- paste(wpath,"geotop.proj",sep="/")


crs <- getProjection(x)




