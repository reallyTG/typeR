library(remote)


### Name: deg2rad
### Title: Convert degrees to radians
### Aliases: deg2rad

### ** Examples

data(vdendool)

## latitude in degrees
degrees <- coordinates(vdendool)[, 2]
head(degrees)

## latitude in radians
radians <- deg2rad(coordinates(vdendool)[, 2])
head(radians)




