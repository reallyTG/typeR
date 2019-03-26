library(GEOmap)


### Name: GEOmap-package
### Title: GEOmap
### Aliases: GEOmap-package GEOmap
### Keywords: package

### ** Examples



################  projections
proj = setPROJ(type = 2, LAT0 =23, LON0 = 35)

### get lat-lon
LL = XY.GLOB(200, 300, proj)


##  find x-y again, should be the same
XY = GLOB.XY(LL$lat, LL$lon, proj)
XY
################
library(geomapdata)
data(worldmap)
  KAMlat = c(48.5,  65)
    KAMlon = c(150, 171)
    
    PLOC=list(LON=KAMlon,LAT=KAMlat)


    PLON = seq(from=KAMlon[1], to=KAMlon[2], by=2)
    PLAT = seq(from=KAMlat[1], to=KAMlat[2], by=2)
    
    proj = setPROJ(2, LON0=mean(KAMlon), LAT0=mean(KAMlat))

 xy = GLOB.XY(KAMlat,  KAMlon , proj)
 kbox=list(x=range(xy$x, na.rm=TRUE), y=range(xy$y, na.rm=TRUE))

 plot(kbox$x,kbox$y, type='n', axes=FALSE, xlab="", ylab="", asp=1)
   plotGEOmapXY(worldmap, LIM=c(KAMlon[1], KAMlat[1], KAMlon[2],
KAMlat[2]),  add=TRUE, PROJ=proj, axes=FALSE, xlab="", ylab="" )

sqrTICXY(kbox , proj, side=c(1,2,3,4), LLgrid=TRUE, col=grey(.7) )
title("Crude Map of Kamchatka")
   
    



