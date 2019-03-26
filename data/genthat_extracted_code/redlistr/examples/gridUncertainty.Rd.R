library(redlistr)


### Name: gridUncertainty
### Title: Function to compute AOO with grid uncertainty systematically
###   with stopping rule
### Aliases: gridUncertainty

### ** Examples

crs.UTM55S <- '+proj=utm +zone=55 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs'
r1 <- raster(ifelse((volcano<130), NA, 1), crs = crs.UTM55S)
extent(r1) <- extent(0, 6100, 0, 8700)
x <- gridUncertainty(r1, grid.size = 10000, n.AOO.improvement = 5,
                           min.percent.rule = FALSE, percent = 1)



