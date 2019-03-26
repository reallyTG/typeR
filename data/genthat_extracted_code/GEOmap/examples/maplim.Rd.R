library(GEOmap)


### Name: maplim
### Title: Map Limits
### Aliases: maplim
### Keywords: misc

### ** Examples


lat = rnorm(10, m=46, sd=2)
lon = rnorm(10, m=-121, sd=1)

M = maplim(lat, lon, pct=.2)

plot(M$lon, M$lat, type='n')
points(lon, lat)

############   plotting with a GEOmap
library(geomapdata)
data(worldmap)

PROJ = setPROJ(type=2, LON0=mean(lon), LAT0=mean(lat))

plotGEOmapXY(worldmap, LIM=M$LIM)
pointsGEOmapXY(lat, lon,PROJ =PROJ,  pch=6)







