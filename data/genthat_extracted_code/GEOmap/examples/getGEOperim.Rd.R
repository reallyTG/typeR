library(GEOmap)


### Name: getGEOperim
### Title: Get Lat-Lon Perimeter
### Aliases: getGEOperim
### Keywords: misc

### ** Examples


###  target region
PLOC= list(LON=c(138.3152, 139.0214),
LAT=c(35.09047, 35.57324))

PLOC$x =PLOC$LON
PLOC$y =PLOC$LAT

####  set up projection
PROJ = setPROJ(type=2, LAT0=mean(PLOC$y) , LON0=mean(PLOC$x) )



perim= getGEOperim(PLOC$LON, PLOC$LAT, PROJ, 50)




