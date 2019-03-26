library(GSIF)


### Name: REST.SoilGrids-class
### Title: A class for SoilGrids REST API
### Aliases: REST.SoilGrids-class REST.SoilGrids
###   over,REST.SoilGrids,SpatialPoints-method
### Keywords: classes

### ** Examples

## Not run: 
##D library(rjson)
##D library(sp)
##D ## 2 points:
##D pnts <- data.frame(lon=c(10.65,5.36), lat=c(51.81,51.48), id=c("p1","p2"))
##D coordinates(pnts) <- ~lon+lat
##D proj4string(pnts) <- CRS("+proj=longlat +datum=WGS84")
##D pnts
##D ## REST example:
##D soilgrids.r <- REST.SoilGrids(c("ORCDRC","PHIHOX"))
##D ov <- over(soilgrids.r, pnts)
##D str(ov)
## End(Not run)



