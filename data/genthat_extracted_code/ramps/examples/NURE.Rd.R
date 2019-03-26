library(ramps)


### Name: NURE
### Title: Dataset of USGS NURE Uranium Measurements
### Aliases: NURE NURE.grid
### Keywords: datasets

### ** Examples

data(NURE)

## Map areal and point-source measurements
ppm1 <- NURE$ppm[NURE$measurement == 1]
level <- (max(ppm1) - ppm1) / diff(range(ppm1))
map("county", "connecticut", fill = TRUE, col = gray(level))
title("Connecticut Uranium Measurements")
points(NURE$lon, NURE$lat)

## Map grid sites
map("county", "connecticut")
title("Regular Grid of Coordinates")
points(NURE.grid$lon, NURE.grid$lat)



