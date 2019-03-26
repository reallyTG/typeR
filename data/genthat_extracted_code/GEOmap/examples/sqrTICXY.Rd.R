library(GEOmap)


### Name: sqrTICXY
### Title: Tick marks for Square plot
### Aliases: sqrTICXY
### Keywords: misc

### ** Examples


 KAMlat = c(48.5,  65)
    KAMlon = c(150, 171)
    proj = setPROJ( 2, LAT0=mean(KAMlat) , LON0=mean(KAMlon) )
    PLOC=list(LON=KAMlon,LAT=KAMlat)


    PLON = seq(from=KAMlon[1], to=KAMlon[2], by=2)
    PLAT = seq(from=KAMlat[1], to=KAMlat[2], by=2)
    
    proj = setPROJ(2, LON0=mean(KAMlon), LAT0=mean(KAMlat))
library(geomapdata)
data(worldmap)

 plotGEOmapXY(worldmap, LIM=c(KAMlon[1], KAMlat[1], KAMlon[2], KAMlat[2]),
PROJ =proj, axes=FALSE, xlab="", ylab="" )

kbox = GLOB.XY( KAMlat,KAMlon, proj)
 sqrTICXY(kbox , proj, side=c(1,2,3,4), LLgrid=TRUE, col=grey(.7) )

#############  more detailed map:
data(kammap)

 plotGEOmapXY(kammap, LIM=c(KAMlon[1], KAMlat[1], KAMlon[2], KAMlat[2]),
PROJ =proj, axes=FALSE, xlab="", ylab="" )

kbox = GLOB.XY( KAMlat,KAMlon, proj)
 sqrTICXY(kbox , proj, side=c(1,2,3,4), LLgrid=TRUE, col=grey(.7) )
   





