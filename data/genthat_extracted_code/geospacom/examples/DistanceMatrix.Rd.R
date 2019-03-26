library(geospacom)


### Name: DistanceMatrix
### Title: Computes distance matrices
### Aliases: DistanceMatrix
### Keywords: spatial

### ** Examples

## load the CRS projection definition and a shape file
data(CH1903)
## Not run: 
##D   yu.reg <- ReadPoly("path/to/my/shapefile.shp", proj = CH1903)
##D 
##D 
##D data(yu.reg)
##D names(yu.reg) <- "area.name"
##D d.geo <- DistanceMatrix(yu.reg, "area.name", longlat = FALSE)
## End(Not run)



