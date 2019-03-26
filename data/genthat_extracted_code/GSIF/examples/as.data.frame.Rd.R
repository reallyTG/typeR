library(GSIF)


### Name: as.data.frame
### Title: Converts an object of class '"SoilProfileCollection"' to a data
###   frame
### Aliases: as.data.frame as.data.frame,SoilProfileCollection-method
###   getHorizons
### Keywords: methods

### ** Examples

library(aqp)
library(plyr)
library(rgdal)
library(sp)
## sample profile from Nigeria:
lon = 3.90; lat = 7.50; id = "ISRIC:NG0017"; FAO1988 = "LXp" 
top = c(0, 18, 36, 65, 87, 127) 
bottom = c(18, 36, 65, 87, 127, 181)
ORCDRC = c(18.4, 4.4, 3.6, 3.6, 3.2, 1.2)
## prepare a SoilProfileCollection:
prof1 <- join(data.frame(id, top, bottom, ORCDRC), 
    data.frame(id, lon, lat, FAO1988), 
    type='inner')
depths(prof1) <- id ~ top + bottom
site(prof1) <- ~ lon + lat + FAO1988 
coordinates(prof1) <- ~ lon + lat
proj4string(prof1) <- CRS("+proj=longlat +datum=WGS84")
## convert to a simple table:
x <- as.data.frame(prof1)
str(x)
## horizons only
horizons <- getHorizons(x, idcol="id", sel=c("top", "bottom", "ORCDRC"))
horizons



