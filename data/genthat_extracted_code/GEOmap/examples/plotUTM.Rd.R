library(GEOmap)


### Name: plotUTM
### Title: Plot UTM
### Aliases: plotUTM
### Keywords: misc

### ** Examples

library(geomapdata)

data(USAmap)


proj = setPROJ(type=3, LAT0=33.75, LON0= RPMG::fmod(-79., 360) ,
  LAT1=34.333333,  LAT2=36.166667, LATS=NULL, LONS=NULL,
   DLAT=NULL, DLON=NULL,FE=0,FN=0)



ALOC=list(lon=c(274.5,288), lat=c(31, 38),
         LON=c(274.5, 288), LAT=c(31, 38), shiftlon=0)

plotGEOmapXY(USAmap, LIM=c(ALOC$LON[1], ALOC$lat[1],
     ALOC$LON[2], ALOC$lat[2]) , PROJ=proj, add=FALSE, shiftlon=0)


plotUTM(proj, c(ALOC$LON[1], ALOC$lat[1], ALOC$LON[2], ALOC$lat[2]))

##############  larger scale

## Not run: 
##D library(geomapdata)
##D 
##D data(USAmap)
##D 
##D 
##D p = plotusa(USAmap)
##D 
##D plotUTM(p$PROJ, LIM=p$LIM)
## End(Not run)




