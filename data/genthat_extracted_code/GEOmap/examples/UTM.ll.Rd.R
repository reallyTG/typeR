library(GEOmap)


### Name: UTM.ll
### Title: Map projection
### Aliases: UTM.ll utm.wgs84.ll
### Keywords: misc

### ** Examples

lat = 40.5
lon = -73.50
LON = RPMG::fmod(lon, 360)

uzone = UTMzone(lat, lon)
lon0 = uzone$CEN[2]
####  clark1866
wproj8 = setPROJ(type = 8, LAT0 = 0 , LON0 = lon0,  IDATUM=8)
uu = UTM.xy(lat, LON  , wproj8)
 UTM.ll(uu$x, uu$y ,wproj8)

###  wgs84
wproj1 = setPROJ(type = 8, LAT0 = 0 , LON0 = lon0  , IDATUM=1)
uu = UTM.xy(lat,LON  , wproj1)

 UTM.ll(uu$x, uu$y ,wproj1)







