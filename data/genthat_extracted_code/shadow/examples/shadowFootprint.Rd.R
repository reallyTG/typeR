library(shadow)


### Name: shadowFootprint
### Title: Shadow footprint on the ground
### Aliases: shadowFootprint
###   shadowFootprint,SpatialPolygonsDataFrame-method

### ** Examples

location = rgeos::gCentroid(build)
time = as.POSIXct("2004-12-24 13:30:00", tz = "Asia/Jerusalem")
solar_pos = maptools::solarpos(
  matrix(c(34.7767978098526, 31.9665936050395), ncol = 2),
  time
  )
footprint1 =               ## Using 'solar_pos'
  shadowFootprint(
    obstacles = build,
    obstacles_height_field = "BLDG_HT",
    solar_pos = solar_pos
    )
footprint2 =               ## Using 'time'
  shadowFootprint(
    obstacles = build,
    obstacles_height_field = "BLDG_HT",
    time = time
    )
all.equal(footprint1, footprint2)
footprint = footprint1
plot(footprint, col = adjustcolor("lightgrey", alpha.f = 0.5))
plot(build, add = TRUE, col = "darkgrey")




