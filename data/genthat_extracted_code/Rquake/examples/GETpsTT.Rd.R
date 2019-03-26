library(Rquake)


### Name: GETpsTT
### Title: Get Pand S travel times and derivatives
### Aliases: GETpsTT
### Keywords: misc

### ** Examples


## Not run: 
##D library(RSEIS)
##D library(GEOmap)
##D 
##D 
##D data(GH)
##D 
##D 
##D 
##D data(VELMOD1D)
##D vel = VELMOD1D
##D 
##D 
##D p1 = GH$pickfile$STAS
##D 
##D 
##D loc = GH$pickfile$LOC
##D 
##D 
##D proj  = GEOmap::setPROJ(type = 2, LAT0 =loc$lat, LON0 =  loc$lon)
##D 
##D 
##D XYsta = GEOmap::GLOB.XY(p1$lat, p1$lon, proj)
##D XYq =   GEOmap::GLOB.XY(loc$lat, loc$lon, proj)
##D 
##D delx = XYq$x-XYsta$x
##D dely = XYq$y-XYsta$y
##D dists = sqrt(delx^2+dely^2)
##D 
##D G1 = GETpsTT(p1$phase, eqz=loc$z, staz=0, delx=delx, dely=dely,  deltadis=dists , vel)
##D 
## End(Not run)
  




