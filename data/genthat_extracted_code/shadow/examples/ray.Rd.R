library(shadow)


### Name: ray
### Title: Line between two points
### Aliases: ray

### ** Examples

ctr = rgeos::gCentroid(build)
angles = seq(0, 359, 20)
sun = mapply(
  shadow:::.sunLocation,
  sun_az = angles,
  MoreArgs = list(
    location = ctr,
    sun_elev = 10)
)
rays = mapply(ray, MoreArgs = list(from = ctr), to = sun)
rays$makeUniqueIDs = TRUE
rays = do.call(rbind, rays)
plot(rays)
sun = do.call(rbind, sun)
text(sun, as.character(angles))




