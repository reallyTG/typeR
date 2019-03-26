library(shadow)


### Name: shiftAz
### Title: Shift features by azimuth and distance
### Aliases: shiftAz

### ** Examples

s = c(270, 90, 180, 0)
build_shifted = shiftAz(build, az = s, dist = 2.5)
plot(build)
plot(build_shifted, add = TRUE, border = "red")
raster::text(rgeos::gCentroid(build, byid = TRUE), s)




