library(shadow)


### Name: SVF
### Title: Sky View Factor (SVF) calculation
### Aliases: SVF SVF,SpatialPoints-method SVF,Raster-method

### ** Examples

## Individual locations
location0 = rgeos::gCentroid(build)
location1 = raster::shift(location0, 0, -15)
location2 = raster::shift(location0, -10, 20)
locations = rbind(location1, location2)
svfs = SVF(
  location = locations,
  obstacles = build,
  obstacles_height_field = "BLDG_HT"
)
plot(build)
plot(locations, add = TRUE)
raster::text(locations, round(svfs, 2), col = "red", pos = 3)

## Not run: 
##D 
##D ## Grid
##D ext = as(raster::extent(build), "SpatialPolygons")
##D r = raster::raster(ext, res = 5)
##D proj4string(r) = proj4string(build)
##D pnt = raster::rasterToPoints(r, spatial = TRUE)
##D svfs = SVF(
##D     location = r,
##D     obstacles = build,
##D     obstacles_height_field = "BLDG_HT",
##D     parallel = 3
##D   )
##D plot(svfs, col = grey(seq(0.9, 0.2, -0.01)))
##D raster::contour(svfs, add = TRUE)
##D plot(build, add = TRUE, border = "red")
##D 
##D ## 3D points
##D ctr = rgeos::gCentroid(build)
##D heights = seq(0, 28, 1)
##D loc3d = data.frame(
##D     x = coordinates(ctr)[, 1],
##D     y = coordinates(ctr)[, 2],
##D     z = heights
##D )
##D coordinates(loc3d) = ~ x + y + z
##D proj4string(loc3d) = proj4string(build)
##D svfs = SVF(
##D     location = loc3d,
##D     obstacles = build,
##D     obstacles_height_field = "BLDG_HT",
##D     parallel = 3
##D )
##D plot(heights, svfs, type = "b", xlab = "Elevation (m)", ylab = "SVF", ylim = c(0, 1))
##D abline(v = build$BLDG_HT, col = "red")
##D 
##D ## Example from Erell et al. 2012 (p. 19 Fig. 1.2)
##D 
##D # Geometry
##D pol1 = rgeos::readWKT("POLYGON ((0 100, 1 100, 1 0, 0 0, 0 100))")
##D pol2 = rgeos::readWKT("POLYGON ((2 100, 3 100, 3 0, 2 0, 2 100))")
##D pol = sp::rbind.SpatialPolygons(pol1, pol2, makeUniqueIDs = TRUE)
##D pol = sp::SpatialPolygonsDataFrame(pol, data.frame(h = c(1, 1)), match.ID = FALSE)
##D pnt = rgeos::readWKT("POINT (1.5 50)")
##D plot(pol, col = "grey", xlim = c(0, 3), ylim = c(45, 55))
##D plot(pnt, add = TRUE, col = "red")
##D 
##D # Fig. 1.2 reproduction
##D h = seq(0, 2, 0.1)
##D svf = rep(NA, length(h))
##D for(i in 1:length(h)) {
##D   pol$h = h[i]
##D   svf[i] = SVF(location = pnt, obstacles = pol, obstacles_height_field = "h", res_angle = 1)
##D }
##D plot(h, svf, type = "b", ylim = c(0, 1))
##D 
##D # Comparison with SVF values from the book
##D test = c(1, 0.9805806757, 0.9284766909, 0.8574929257, 0.7808688094,
##D 0.7071067812, 0.6401843997, 0.5812381937, 0.52999894, 0.4856429312,
##D 0.4472135955, 0.4138029443, 0.3846153846, 0.3589790793, 0.336336397,
##D 0.316227766, 0.2982749931, 0.282166324, 0.2676438638, 0.2544932993,
##D 0.242535625)
##D range(test - svf)
##D 
## End(Not run)




