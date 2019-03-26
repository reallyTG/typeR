library(plotGoogleMaps)


### Name: stplotGoogleMaps
### Title: Create a plot of spacetime (STDIF,STFDF) data on Google Maps
### Aliases: stplotGoogleMaps

### ** Examples

## Data preparation
## Point data
## data from plotKML package and plotKML tutorial
#library(plotKML)
#data(HRtemp08)
# HRtemp08$ctime <- as.POSIXct(HRtemp08$DATE, format="%Y-%m-%dT%H:%M:%SZ")
# library(spacetime)
# sp <- SpatialPoints(HRtemp08[,c("Lon","Lat")])
# proj4string(sp) <- CRS("+proj=longlat +datum=WGS84")
# HRtemp08.st <- STIDF(sp, time = HRtemp08$ctime, data = HRtemp08[,c("NAME","TEMP")])
# HRtemp08_jan <- HRtemp08.st[1:500]
#str(HRtemp08_jan)
# plot STDIF
# stplotGoogleMaps(HRtemp08_jan,zcol='TEMP', mapTypeId='ROADMAP',w='49%',h='49%')
# plot STDIF bubble 
# stplotGoogleMaps(HRtemp08_jan,zcol='TEMP',stfilename='HR_temp.html', 
#            mapTypeId='ROADMAP',w='49%',h='49%',  strokeOpacity = 0,
#           do.bubble=T, bubble= list(max.radius=15000,
#           key.entries =quantile(HRtemp08_jan@data[,'TEMP'],(1:5)/5, na.rm=T),
#                  do.sqrt = F) )
#
############################################################################
## STFDF data from spacetime vignette spacetime: Spatio-Temporal Data in R 
#library("maps")
# states.m = map('state', plot=FALSE, fill=TRUE)
# IDs <- sapply(strsplit(states.m$names, ":"), function(x) x[1])
# library("maptools")
#states = map2SpatialPolygons(states.m, IDs=IDs)
#yrs = 1970:1986
#time = as.POSIXct(paste(yrs, "-01-01", sep=""), tz = "GMT")
# library("plm")
#data("Produc")
#Produc.st = STFDF(states[-8], time, Produc[order(Produc[2], Produc[1]),])
#Produc.st@sp@proj4string=CRS('+proj=longlat +datum=WGS84')
#library(RColorBrewer)
#ee= stplotGoogleMaps(Produc.st,zcol='unemp',stfilename='USA.htm',
#   colPalette=brewer.pal(9, "YlOrRd"), mapTypeId='ROADMAP',
#w='49%',h='49%', fillOpacity=0.85)
## without control
# ee= stplotGoogleMaps(Produc.st,zcol='unemp',
#   stfilename='USA2.htm',colPalette=brewer.pal(9, "YlOrRd"), 
# mapTypeId='ROADMAP',w='33%',h='25%', fillOpacity=0.85, control.width=0)                



