library(GEOmap)


### Name: GLOB.XY
### Title: Convert from GLOBAL LAT-LON to X-Y
### Aliases: GLOB.XY
### Keywords: misc

### ** Examples



proj = setPROJ(type = 2, LAT0 =23, LON0 = 35)

### get lat-lon
LL = XY.GLOB(200, 300, proj)


##  find x-y again, should be the same
XY = GLOB.XY(LL$lat, LL$lon, proj)
XY





