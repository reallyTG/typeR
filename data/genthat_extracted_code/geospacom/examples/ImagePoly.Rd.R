library(geospacom)


### Name: ImagePoly
### Title: Plots regional data in map plots
### Aliases: ImagePoly
### Keywords: spatial

### ** Examples

## Not run: 
##D data(CH1903)
##D yu.reg <- ReadPoly("path/to/my/shapefile.shp", proj = CH1903)
##D 
##D data(yu.reg)
##D names(yu.reg) <- "area.name"
##D d.geo <- DistanceMatrix(yu.reg, "area.name", longlat = FALSE)
##D 
##D data(homog_census)
##D ImagePoly(poly=yu.reg, 
##D 	  dataframe=homog_census, 
##D 	  context.id="area.name", 
##D 	  names ="Homog_00")
## End(Not run)



