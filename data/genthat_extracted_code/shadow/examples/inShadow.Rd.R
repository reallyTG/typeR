library(shadow)


### Name: inShadow
### Title: Logical shadow calculation (is given point shaded?) for 3D
###   points considering sun position and obstacles
### Aliases: inShadow inShadow,SpatialPoints,Raster,missing,missing-method
###   inShadow,SpatialPoints,missing,ANY,ANY-method
###   inShadow,Raster,missing,ANY,ANY-method

### ** Examples

# Method for 3D points - Manually defined

opar = par(mfrow = c(1, 3))

# Ground level
location = sp::spsample(
  rgeos::gBuffer(rgeos::gEnvelope(build), width = 20),
  n = 100,
  type = "regular"
)
solar_pos = as.matrix(tmy[9, c("sun_az", "sun_elev")])
s = inShadow(
  location = location,
  obstacles = build,
  obstacles_height_field = "BLDG_HT",
  solar_pos = solar_pos
)
plot(location, col = ifelse(s[, 1], "grey", "yellow"), main = "h=0")
plot(build, add = TRUE)

# 15 meters above ground level
coords = coordinates(location)
coords = cbind(coords, z = 15)
location1 = SpatialPoints(coords, proj4string = CRS(proj4string(location)))
solar_pos = as.matrix(tmy[9, c("sun_az", "sun_elev")])
s = inShadow(
  location = location1,
  obstacles = build,
  obstacles_height_field = "BLDG_HT",
  solar_pos = solar_pos
)
plot(location, col = ifelse(s[, 1], "grey", "yellow"), main = "h=15")
plot(build, add = TRUE)

# 30 meters above ground level
coords = coordinates(location)
coords = cbind(coords, z = 30)
location2 = SpatialPoints(coords, proj4string = CRS(proj4string(location)))
solar_pos = as.matrix(tmy[9, c("sun_az", "sun_elev")])
s = inShadow(
  location = location2,
  obstacles = build,
  obstacles_height_field = "BLDG_HT",
  solar_pos = solar_pos
)
plot(location, col = ifelse(s[, 1], "grey", "yellow"), main = "h=30")
plot(build, add = TRUE)

par(opar)

# Shadow on a grid covering obstacles surface
## Not run: 
##D 
##D # Method for 3D points - Covering building surface
##D 
##D obstacles = build[c(2, 4), ]
##D location = surfaceGrid(
##D   obstacles = obstacles,
##D   obstacles_height_field = "BLDG_HT",
##D   res = 2,
##D   offset = 0.01
##D )
##D solar_pos = tmy[c(9, 16), c("sun_az", "sun_elev")]
##D solar_pos = as.matrix(solar_pos)
##D s = inShadow(
##D   location = location,
##D   obstacles = obstacles,
##D   obstacles_height_field = "BLDG_HT",
##D   solar_pos = solar_pos
##D )
##D location$shadow = s[, 1]
##D plotGrid(location, color = c("yellow", "grey")[as.factor(location$shadow)], size = 0.5)
##D location$shadow = s[, 2]
##D plotGrid(location, color = c("yellow", "grey")[as.factor(location$shadow)], size = 0.5)
##D 
##D # Method for ground locations raster
##D 
##D ext = as(raster::extent(build) + 20, "SpatialPolygons")
##D location = raster::raster(ext, res = 2)
##D proj4string(location) = proj4string(build)
##D obstacles = build[c(2, 4), ]
##D solar_pos = tmy[c(9, 16), c("sun_az", "sun_elev")]
##D solar_pos = as.matrix(solar_pos)
##D s = inShadow(                ## Using 'solar_pos'
##D   location = location,
##D   obstacles = obstacles,
##D   obstacles_height_field = "BLDG_HT",
##D   solar_pos = solar_pos,
##D   parallel = 3
##D )
##D time = as.POSIXct(tmy$time[c(9, 16)], tz = "Asia/Jerusalem")
##D s = inShadow(               ## Using 'time'
##D   location = location,
##D   obstacles = obstacles,
##D   obstacles_height_field = "BLDG_HT",
##D   time = time,
##D   parallel = 3
##D )
##D plot(s)
##D 
##D # Method for pre-calculated shadow height raster
##D 
##D ext = as(raster::extent(build), "SpatialPolygons")
##D r = raster::raster(ext, res = 1)
##D proj4string(r) = proj4string(build)
##D r[] = rep(seq(30, 0, length.out = ncol(r)), times = nrow(r))
##D location = surfaceGrid(
##D   obstacles = build[c(2, 4), ],
##D   obstacles_height_field = "BLDG_HT",
##D   res = 2,
##D   offset = 0.01
##D )
##D s = inShadow(
##D   location = location,
##D   shadowHeightRaster = r
##D )
##D location$shadow = s[, 1]
##D r_pnt = raster::as.data.frame(r, xy = TRUE)
##D coordinates(r_pnt) = names(r_pnt)
##D proj4string(r_pnt) = proj4string(r)
##D r_pnt = SpatialPointsDataFrame(
##D   r_pnt,
##D   data.frame(
##D     shadow = rep(TRUE, length(r_pnt)),
##D     stringsAsFactors = FALSE
##D     )
##D  )
##D pnt = rbind(location[, "shadow"], r_pnt)
##D plotGrid(pnt, color = c("yellow", "grey")[as.factor(pnt$shadow)], size = 0.5)
##D 
##D # Automatically calculating 'solar_pos' using 'time' - Points
##D location = sp::spsample(
##D   rgeos::gBuffer(rgeos::gEnvelope(build), width = 20),
##D   n = 500,
##D   type = "regular"
##D )
##D time = as.POSIXct("2004-12-24 13:30:00", tz = "Asia/Jerusalem")
##D s = inShadow(
##D   location = location,
##D   obstacles = build,
##D   obstacles_height_field = "BLDG_HT",
##D   time = time
##D )
##D plot(location, col = ifelse(s[, 1], "grey", "yellow"), main = time)
##D plot(build, add = TRUE)
##D 
## End(Not run)




