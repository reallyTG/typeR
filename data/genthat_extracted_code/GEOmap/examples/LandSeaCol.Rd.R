library(GEOmap)


### Name: LandSeaCol
### Title: Land and Sea Colors
### Aliases: LandSeaCol
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D Lat.range = c(-10, 30)
##D Lon.range = c(65, 117)
##D ######
##D 
##D ########  load up the important libraries
##D  library(RFOC)
##D 
##D  library(geomapdata)
##D 
##D  data(coastmap)
##D 
##D      data(ETOPO5)
##D  PLOC=list(LON=Lon.range,LAT=Lat.range,lon=Lon.range,lat=Lat.range,
##D                  x=Lon.range, y=Lat.range )
##D 
##D 
##D #####   set up topography colors
##D COLS = settopocol()
##D 
##D ####  set the projection ##   utm
##D  PROJ = setPROJ(type=2, LAT0=mean(PLOC$y) , LON0=mean(PLOC$x) )   
##D  NK = 300
##D     
##D    ###   extract topography from the etopo5 data base in geomapdata
##D      JMAT = GEOTOPO(ETOPO5, PLOC, PROJ, COLS$calcol,nx=NK, ny=NK )
##D #####   select relevant earthquakes
##D 
##D IZ = list(x=JMAT$xo, y=JMAT$yo, z=JMAT$IZ$z)
##D 
##D CMAT = LandSeaCol(IZ, coastmap, PROJ, calcol=NULL)
##D 
##D Mollist =CMAT$Cmat
##D dMol = attr(Mollist, "Dcol")
##D 
##D      ####  Under water
##D UZ = CMAT$UZ
##D     #####  above water
##D AZ = CMAT$AZ
##D     ####   blues for underwater:
##D    blues = shade.col(100, acol=as.vector(col2rgb("darkblue")/255),
##D         bcol= as.vector(col2rgb("paleturquoise")/255))
##D 
##D plot(x=range(IZ$x), y=range(IZ$y),
##D          type='n', asp=1, axes=FALSE, ann=FALSE)
##D 
##D image(x=IZ$x, y=IZ$y, z=(UZ), col=blues, add=TRUE)
##D 
##D image(x=IZ$x, y=IZ$y, z=(AZ), col=terrain.colors(100) , add=TRUE)
##D 
##D plotGEOmapXY(coastmap,
##D        LIM = c(Lon.range[1],Lat.range[1] ,Lon.range[2] ,Lat.range[2]),
##D        PROJ =PROJ,MAPstyle =2,MAPcol ="black" ,   add=TRUE  )
##D 
##D 
##D 
##D 
## End(Not run)





