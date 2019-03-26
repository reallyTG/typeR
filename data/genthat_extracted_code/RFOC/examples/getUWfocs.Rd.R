library(RFOC)


### Name: getUWfocs
### Title: Get UW focals
### Aliases: getUWfocs
### Keywords: misc

### ** Examples


## Not run: 
##D #####  uwpickfile is an ascii format file from University of Washington
##D G1 = getUWfocs(uwpickfile)
##D 
##D plot(G1$lon, G1$lat)
##D 
##D  MEKS = list(lon=G1$lon, lat=G1$lat, str1=G1$str1,
##D dip1=G1$dip1, rake1=G1$rake1, dep=G1$z, name=G1$name)
##D 
##D ##   utm projection
##D  PROJ = GEOmap::setPROJ(type=2, LAT0=mean(G1$lat) , LON0=mean(G1$lon) )   
##D 
##D      XY = GEOmap::GLOB.XY(G1$lat, G1$lon, PROJ)
##D 
##D      plot(range(XY$x), range(XY$y), type='n', asp=1)
##D 
##D      plotmanyfoc(MEKS, PROJ, focsiz=0.05)
##D 
##D 
##D 
## End(Not run)






