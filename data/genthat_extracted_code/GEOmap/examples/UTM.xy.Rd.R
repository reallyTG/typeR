library(GEOmap)


### Name: UTM.xy
### Title: Map projection
### Aliases: UTM.xy utm.wgs84.xy
### Keywords: misc

### ** Examples

lat = 40.5
lon = -73.50
lon0 = -75
LON = RPMG::fmod(lon, 360)

wproj = setPROJ(type = 5, LAT0 = 0 , LON0 = lon0 , FE = 0 )

u1 = utm.elps.xy(lat, LON ,wproj ) 
utm.wgs84.xy(lat, LON ,wproj)

####  also for more general UTM:
###  this is the wgs84 projection
wproj1 = setPROJ(type = 8, LAT0 = 0 , LON0 = lon0 , FE = 0 , IDATUM=1 )
UTM.xy(lat, LON,wproj1)

###  this is the Clark-1866 (see page 270 in Snyder)
wproj8 = setPROJ(type = 8, LAT0 = 0 , LON0 = lon0 , FE = 0 , IDATUM=8)
UTM.xy(lat, LON,wproj8)

##  which is the same as:

uzone = UTMzone(lat, lon)

lon0 = uzone$CEN[2]
wproj = setPROJ(type = 5, LAT0 = 0 , LON0 = lon0 , FE = 500000 )
utm.elps.xy(lat, LON,wproj )


## to see all the Datums, use: DATUMinfo()





