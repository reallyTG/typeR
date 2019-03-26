library(redlistr)


### Name: gridUncertaintyRandom
### Title: Function to compute AOO with grid uncertainty randomly with stop
###   rule
### Aliases: gridUncertaintyRandom

### ** Examples

crs.UTM55S <- '+proj=utm +zone=55 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs'
r1 <- raster(ifelse((volcano<130), NA, 1), crs = crs.UTM55S)
extent(r1) <- extent(0, 6100, 0, 8700)
x <- gridUncertaintyRandom(r1, grid.size = 10000, n.AOO.improvement = 50,
                           min.percent.rule = TRUE, percent = 1)



