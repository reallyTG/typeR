library(GSIF)


### Name: as.geosamples
### Title: Converts an object to geosamples class
### Aliases: as.geosamples as.geosamples,SoilProfileCollection-method
###   as.geosamples,SpatialPointsDataFrame-method
### Keywords: methods

### ** Examples

library(aqp)
library(plyr)
library(rgdal)
library(sp)
# sample profile from Nigeria:
lon = 3.90; lat = 7.50; time = as.POSIXct("1978", format="%Y") 
id = "ISRIC:NG0017"; TAXNFAO8 = "LXp" 
top = c(0, 18, 36, 65, 87, 127) 
bottom = c(18, 36, 65, 87, 127, 181)
ORCDRC = c(18.4, 4.4, 3.6, 3.6, 3.2, 1.2)
methodid = c("TAXNFAO8", "ORCDRC")
description = c("FAO 1988 classification system group", 
    "Method of Walkley-Black (Org. matter = Org. C x 1.72)")
units = c("FAO 1988 classes", "permille")
detectionLimit = c(as.character(NA), "0.1")
# prepare a SoilProfileCollection:
prof1 <- join(data.frame(id, top, bottom, ORCDRC), 
    data.frame(id, lon, lat, time, TAXNFAO8), type='inner')
depths(prof1) <- id ~ top + bottom
site(prof1) <- ~ lon + lat + time + TAXNFAO8 
coordinates(prof1) <- ~ lon + lat + time
proj4string(prof1) <- CRS("+proj=longlat +datum=WGS84")
# add measurement errors:
attr(prof1@horizons$ORCDRC, "measurementError") <- c(1.5, 0.5, 0.5, 0.5, 0.5, 0.5)
attr(prof1@sp@coords, "locationError") <- 1500
# add the metadata:
prof1@metadata <- data.frame(methodid, description, units, detectionLimit)
# convert to geosamples:
x <- as.geosamples(prof1)
x
# print only the sampled values of ORCDRC:
ORCDRC <- subset(x, "ORCDRC")
ORCDRC[,c("sampleid", "altitude", "observedValue")]

# convert object of type SpatialPointsDataFrame:
data(meuse)
# prepare columns:
names(meuse)[which(names(meuse)=="x")] = "longitude"
names(meuse)[which(names(meuse)=="y")] = "latitude"
meuse$altitude = -.15
meuse$time = unclass(as.POSIXct("1992-01-01"))
coordinates(meuse) <- ~ longitude + latitude + altitude + time
proj4string(meuse) <- CRS("+init=epsg:28992")
library(plotKML)
hm <- reproject(meuse[,c("zinc", "copper")])
hm.geo <- as.geosamples(hm)
hm.geo



