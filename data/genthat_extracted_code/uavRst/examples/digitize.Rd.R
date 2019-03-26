library(uavRst)


### Name: digitize
### Title: Easy digitizing of vector features within your rstudio session
###   (or any browser)
### Aliases: digitize

### ** Examples

## Not run: 
##D ##- libs
##D require(sp)
##D require(uavRst)
##D 
##D ##- preset for digitizing uav flight areas in Meuse
##D require(sp)
##D data(meuse) 
##D sp::coordinates(meuse) <- ~x+y 
##D sp::proj4string(meuse) <-sp::CRS("+init=epsg:28992") 
##D me<-sp::spTransform(meuse,CRSobj = sp::CRS("+init=epsg:4326"))
##D uavRst::digitize(overlay = me)
##D   
##D ##- preset for digitizing extents
##D uavRst::digitize(preset="ext",overlay = me)
## End(Not run)




