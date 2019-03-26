library(gstat)


### Name: jura
### Title: Jura data set
### Aliases: jura prediction.dat validation.dat transect.dat juragrid.dat
###   jura.grid jura.pred jura.val
### Keywords: datasets

### ** Examples

data(jura)
summary(prediction.dat)
summary(validation.dat)
summary(transect.dat)
summary(juragrid.dat)

# the following commands were used to create objects with factors instead
# of the integer codes for Landuse and Rock:
## Not run: 
##D   jura.pred = prediction.dat
##D   jura.val = validation.dat
##D   jura.grid = juragrid.dat
##D 
##D   jura.pred$Landuse = factor(prediction.dat$Landuse, 
##D 	labels=levels(juragrid.dat$Landuse))
##D   jura.pred$Rock = factor(prediction.dat$Rock, 
##D 	labels=levels(juragrid.dat$Rock))
##D   jura.val$Landuse = factor(validation.dat$Landuse, 
##D 	labels=levels(juragrid.dat$Landuse))
##D   jura.val$Rock = factor(validation.dat$Rock, 
##D 	labels=levels(juragrid.dat$Rock))
## End(Not run)

# the following commands convert data.frame objects into spatial (sp) objects
#   in the local grid:
require(sp)
coordinates(jura.pred) = ~Xloc+Yloc
coordinates(jura.val) = ~Xloc+Yloc
coordinates(jura.grid) = ~Xloc+Yloc
gridded(jura.grid) = TRUE

# the following commands convert the data.frame objects into spatial (sp) objects
#   in WGS84 geographic coordinates
# example is given only for jura.pred, do the same for jura.val and jura.grid
# EPSG codes can be found by searching make_EPSG()
jura.pred <- as.data.frame(jura.pred)
coordinates(jura.pred) = ~ long + lat
proj4string(jura.pred) = CRS("+init=epsg:4326")
# display in Google Earth
if (require(maptools)) {
  kmlPoints(jura.pred,
		kmlfile="JuraPred.kml",
		kmlname="Jura Prediction Points",name=row.names(jura.pred@data),
		description=paste(jura.pred$Landuse, jura.pred$Rock, sep="/"))


  if (require(rgdal)) {
  # transform to UTM 32N
    jura.pred.utm32n = spTransform(jura.pred,
                                CRS("+init=epsg:32632"))
    coordnames(jura.pred.utm32n) = c("E","N")

    # transform to Swiss grid system CH1903 / LV03
    jura.pred.ch = spTransform(jura.pred,
                             CRS("+init=epsg:21781"))
    coordnames(jura.pred.ch) = c("X","Y")
  }
}




