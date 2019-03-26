library(GEOmap)


### Name: GEOTOPO
### Title: Topographic Plot of geographic region
### Aliases: GEOTOPO
### Keywords: misc hplot

### ** Examples



## Not run: 
##D 
##D library(geomapdata)
##D 
##D 
##D data(ETOPO5)
##D PLOC=list(LON=c(137.008, 141.000),LAT=c(34.000, 36.992),
##D             x=c(137.008, 141.000), y=c(34.000, 36.992) )
##D 
##D  PROJ = setPROJ(type=2, LAT0=mean(PLOC$y) , LON0=mean(PLOC$x) )
##D COLS = settopocol()
##D JMAT = GEOTOPO(ETOPO5, PLOC, PROJ, COLS$calcol, nx=1000, ny=1000, nb=8, mb=8, hb=12, PLOT=TRUE)
##D 
##D ############  this plot can be duplicated by using the output or GEOTOPO
##D 
##D 
##D  PMAT = persp(JMAT$xo, JMAT$yo, JMAT$IZ$z, theta = 0, phi = 90, r=4000,
##D col=JMAT$Cmat[1:(JMAT$Dcol[1]-1), 1:(JMAT$Dcol[2]-1)] , scale = FALSE,
##D       ltheta = 120, lphi=60, shade = 0.75, border = NA, expand=0.001, box = FALSE )
##D 
##D 
## End(Not run)





