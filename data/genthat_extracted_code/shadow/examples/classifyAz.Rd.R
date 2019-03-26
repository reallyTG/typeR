library(shadow)


### Name: classifyAz
### Title: Classify azimuth of line segments
### Aliases: classifyAz

### ** Examples

build_seg = toSeg(build[1, ])
az = classifyAz(build_seg)
plot(build_seg, col = rainbow(4)[cut(az, c(0, 90, 180, 270, 360))])
raster::text(
  rgeos::gCentroid(build_seg, byid = TRUE),
  round(az)
)




