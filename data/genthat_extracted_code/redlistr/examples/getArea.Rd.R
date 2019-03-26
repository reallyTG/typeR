library(redlistr)


### Name: getArea
### Title: Calculates the Area of a Raster.
### Aliases: getArea

### ** Examples

crs.UTM55S <- '+proj=utm +zone=55 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs'
r1 <- raster(ifelse((volcano<130), NA, 1), crs = crs.UTM55S)
extent(r1) <- extent(0, 6100, 0, 8700)
a.r1 <- getArea(r1) # area of all non-NA cells in r1



