library(GEOmap)


### Name: BASICTOPOMAP
### Title: Basic Topogrpahy Map
### Aliases: BASICTOPOMAP
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D 
##D library(geomapdata)
##D library(MBA) ##  for interpolation
##D #######  set up topo data
##D data(fujitopo)
##D #####  set up map data
##D data('japmap', package='geomapdata' )
##D 
##D 
##D ###  target region
##D PLOC= list(LON=c(138.3152, 139.0214), 
##D LAT=c(35.09047, 35.57324))
##D 
##D PLOC$x =PLOC$LON
##D PLOC$y =PLOC$LAT
##D 
##D 
##D 
##D ####  set up projection
##D PROJ = setPROJ(type=2, LAT0=mean(PLOC$y) , LON0=mean(PLOC$x) )
##D 
##D ##########  select data from the topo data internal to the target
##D     topotemp = list(lon=fujitopo$lon, lat= fujitopo$lat, z=fujitopo$z)
##D 
##D     
##D  ####  project target
##D   A = GLOB.XY(PLOC$LAT  , PLOC$LON ,  PROJ)
##D 
##D #######   select topo
##D selectionflag = topotemp$lat>+PLOC$LAT[1] & topotemp$lat<=PLOC$LAT[2] &
##D topotemp$lon>+PLOC$LON[1] & topotemp$lon<=PLOC$LON[2]
##D 
##D 
##D ###  project topo data
##D   B = GLOB.XY( topotemp$lat[selectionflag] ,topotemp$lon[selectionflag] ,  PROJ)
##D 
##D ###  set up out put matrix:
##D ### xo = seq(from=range(A$x)[1], to=range(A$x)[2], length=200)
##D ###    yo = seq(from=range(A$y)[1], to=range(A$y)[2], length=200)
##D 
##D #######  interpolation using akima
##D   ###  IZ = interp(x=B$x , y=B$y,  z=topotemp$z[selectionflag]  , xo=xo, yo=yo)
##D DF = cbind(x=B$x , y=B$y ,  z=topotemp$z[selectionflag])
##D  IZ = mba.surf(DF, 200, 200, extend=TRUE)$xyz.est
##D 
##D     xo = IZ[[1]]
##D     yo = IZ[[2]]
##D 
##D 
##D ###  image(IZ)
##D 
##D #######  underwater section
##D     UZ = IZ$z
##D     UZ[IZ$z>=0] = NA
##D #### above sea level
##D     AZ = IZ$z
##D     AZ[IZ$z<=-.01] = NA
##D 
##D #### create perimeter:
##D     perim= getGEOperim(PLOC$LON, PLOC$LAT, PROJ, 50)
##D 
##D ###  lats for tic marks:
##D     PLAT =  pretty(PLOC$LAT)
##D 
##D     PLAT = c(min(PLOC$LAT),
##D PLAT[PLAT>min(PLOC$LAT) & PLAT<max(PLOC$LAT)],max(PLOC$LAT)) 
##D PLON  = pretty(PLOC$LON)
##D 
##D ### main program:
##D  DOIMG = TRUE
##D DOCONT = TRUE
##D PNTS  = NULL
##D 
##D BASICTOPOMAP(xo, yo , DOIMG, DOCONT, UZ, AZ, IZ, perim, PLAT, PLON,
##D PROJ=PROJ, pnts=NULL, GRIDcol=NULL)
##D 
##D 
##D ###  add in the map information
##D  plotGEOmapXY(japmap, LIM=c(PLOC$LON[1], PLOC$LAT[1],PLOC$LON[2],
##D PLOC$LAT[2]) , PROJ=PROJ, add=TRUE )
##D 
## End(Not run)





