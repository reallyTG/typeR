library(shadow)


### Name: shadowHeight
### Title: Shadow height calculation considering sun position and obstacles
### Aliases: shadowHeight shadowHeight,SpatialPoints-method
###   shadowHeight,Raster-method

### ** Examples

# Single location
location = rgeos::gCentroid(build)
## Not run: 
##D location_geo = spTransform(location, "+proj=longlat +datum=WGS84")
## End(Not run)
location_geo = matrix(c(34.7767978098526, 31.9665936050395), ncol = 2)
time = as.POSIXct("2004-12-24 13:30:00", tz = "Asia/Jerusalem")
solar_pos = maptools::solarpos(location_geo, time)
plot(build, main = time)
plot(location, add = TRUE)
sun = shadow:::.sunLocation(location = location, sun_az = solar_pos[1,1], sun_elev = solar_pos[1,2])
sun_ray = ray(from = location, to = sun)
build_outline = as(build, "SpatialLinesDataFrame")
inter = rgeos::gIntersection(build_outline, sun_ray)
plot(sun_ray, add = TRUE, col = "yellow")
plot(inter, add = TRUE, col = "red")
shadowHeight(
  location = location,
  obstacles = build,
  obstacles_height_field = "BLDG_HT",
  solar_pos = solar_pos
)

# Automatically calculating 'solar_pos' using 'time'
shadowHeight(
  location = location,
  obstacles = build,
  obstacles_height_field = "BLDG_HT",
  time = time
)

## Not run: 
##D 
##D # Two points - three times
##D location0 = rgeos::gCentroid(build)
##D location1 = raster::shift(location0, 0, -15)
##D location2 = raster::shift(location0, -10, 20)
##D locations = rbind(location1, location2)
##D time = as.POSIXct("2004-12-24 13:30:00", tz = "Asia/Jerusalem")
##D times = seq(from = time, by = "1 hour", length.out = 3)
##D shadowHeight(                            ## Using 'solar_pos'
##D   location = locations,
##D   obstacles = build,
##D   obstacles_height_field = "BLDG_HT",
##D   solar_pos = maptools::solarpos(location_geo, times)
##D )
##D shadowHeight(                            ## Using 'time'
##D   location = locations,
##D   obstacles = build,
##D   obstacles_height_field = "BLDG_HT",
##D   time = times
##D )
##D 
##D # Grid - three times
##D time = as.POSIXct("2004-12-24 13:30:00", tz = "Asia/Jerusalem")
##D times = seq(from = time, by = "1 hour", length.out = 3)
##D ext = as(raster::extent(build), "SpatialPolygons")
##D r = raster::raster(ext, res = 2)
##D proj4string(r) = proj4string(build)
##D x = Sys.time()
##D shadow1 = shadowHeight(
##D   location = r,
##D   obstacles = build,
##D   obstacles_height_field = "BLDG_HT",
##D   time = times,
##D   parallel = 3
##D )
##D y = Sys.time()
##D y - x
##D x = Sys.time()
##D shadow2 = shadowHeight(
##D   location = r,
##D   obstacles = build,
##D   obstacles_height_field = "BLDG_HT",
##D   solar_pos = solarpos2(r, times),
##D   parallel = 3
##D )
##D y = Sys.time()
##D y - x
##D shadow = shadow1
##D opar = par(mfrow = c(1, 3))
##D for(i in 1:raster::nlayers(shadow)) {
##D   plot(shadow[[i]], col = grey(seq(0.9, 0.2, -0.01)), main = raster::getZ(shadow)[i])
##D   raster::contour(shadow[[i]], add = TRUE)
##D   plot(build, border = "red", add = TRUE)
##D }
##D par(opar)
##D 
## End(Not run)



