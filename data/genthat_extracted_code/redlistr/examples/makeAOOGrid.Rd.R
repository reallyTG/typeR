library(redlistr)


### Name: makeAOOGrid
### Title: Create Area of Occupancy (AOO) grid for an ecosystem or species
###   distribution
### Aliases: makeAOOGrid

### ** Examples

crs.UTM55S <- '+proj=utm +zone=55 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs'
r1 <- raster(ifelse((volcano<130), NA, 1), crs = crs.UTM55S)
extent(r1) <- extent(0, 6100, 0, 8700)
AOO_grid <- makeAOOGrid(r1, 10000, min.percent.rule = TRUE, percent = 1)



