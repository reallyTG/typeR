library(GEOmap)


### Name: setPROJ
### Title: Set Projection
### Aliases: setPROJ
### Keywords: misc

### ** Examples


######  type
projtype()
######  type = mercator spherical
setPROJ(type = 1, LAT0 =23, LON0 = 35)

### Hengill Map: lambert.cc
setPROJ(type=3, LAT0=65, LON0=360-19 ,LAT1=64+15/60,
LAT2=65+45/60,LATS=NULL, 
LONS=NULL, DLAT=NULL, DLON=NULL,FE=500000,FN=500000)

### old lees/crosson projection
setPROJ(type=99, LAT0=23, LON0=35, LATS=NULL, LONS=NULL, DLAT=NULL,
DLON=NULL, FN =0)

###  world map equid.cyl
setPROJ(6, LAT0=0, LON0=0)

##  North Carolina Map lambert.cc
setPROJ(type=3, LAT0=36+20/60, LON0=78+30/60,LAT1=36+46/60,
LAT2=37+58/60, LATS=NULL, LONS=NULL, DLAT=NULL, DLON=NULL,FE=0,FN=0)

###  No Projection
setPROJ(type = 0, LAT0 =23, LON0 = 35)





