library(spex)


### Name: spex
### Title: Polygon extent
### Aliases: spex spex spex.default spex spex.Extent spex spex.sf

### ** Examples

library(raster)
data(lux)
exlux <- spex(lux)

plot(lux)
plot(exlux, add = TRUE)

## put an extent and a CRS together
spex(extent(0, 1, 0, 1), crs = "+proj=laea +ellps=WGS84")



