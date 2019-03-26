library(oce)


### Name: oce.contour
### Title: Oce Variant of contour
### Aliases: oce.contour oceContour

### ** Examples


library(oce)
data(topoWorld)
## coastline now, and in last glacial maximum
lon <- topoWorld[["longitude"]]
lat <- topoWorld[["latitude"]]
z <- topoWorld[["z"]]
oce.contour(lon, lat, z, levels=0, drawlabels=FALSE)
oce.contour(lon, lat, z, levels=-130, drawlabels=FALSE, col='blue', add=TRUE)



