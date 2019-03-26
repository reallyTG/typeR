library(shadow)


### Name: radiation
### Title: Estimation of Direct and Diffuse Radiation Load on Extruded
###   Polygon Surfaces
### Aliases: radiation

### ** Examples


# Create surface grid
grid = surfaceGrid(
  obstacles = build[1, ],
  obstacles_height_field = "BLDG_HT",
  res = 2
)

solar_pos = tmy[, c("sun_az", "sun_elev")]
solar_pos = as.matrix(solar_pos)

# Summed 10-hour radiation estimates for two 3D points
rad1 = radiation(
  grid = grid[1:2, ],
  obstacles = build,
  obstacles_height_field = "BLDG_HT",
  solar_pos = solar_pos[8:17, , drop = FALSE],
  solar_normal = tmy$solar_normal[8:17],
  solar_diffuse = tmy$solar_diffuse[8:17],
  returnList = TRUE
)
rad1

## Not run: 
##D 
##D # Same, using 'time' instead of 'solar_pos'
##D 
##D rad2 = radiation(
##D   grid = grid[1:2, ],
##D   obstacles = build,
##D   obstacles_height_field = "BLDG_HT",
##D   time = as.POSIXct(tmy$time[8:17], tz = "Asia/Jerusalem"),
##D   solar_normal = tmy$solar_normal[8:17],
##D   solar_diffuse = tmy$solar_diffuse[8:17],
##D   returnList = TRUE
##D )
##D rad2
##D 
##D # Differences due to the fact that 'tmy' data come with their own
##D # solar positions, not exactly matching those calulated using 'maptools::solarpos'
##D rad1$direct - rad2$direct
##D rad1$diffuse - rad2$diffuse
##D 
## End(Not run)

## Not run: 
##D 
##D ### Warning! The calculation below takes some time.
##D 
##D # Annual radiation estimates for entire surface of one building
##D rad = radiation(
##D   grid = grid,
##D   obstacles = build,
##D   obstacles_height_field = "BLDG_HT",
##D   solar_pos = solar_pos,
##D   solar_normal = tmy$solar_normal,
##D   solar_diffuse = tmy$solar_diffuse,
##D   parallel = 3
##D )
##D 
##D # 3D plot of the results
##D library(plot3D)
##D opar = par(mfrow=c(1, 3))
##D 
##D scatter3D(
##D   x = coordinates(grid)[, 1],
##D   y = coordinates(grid)[, 2],
##D   z = coordinates(grid)[, 3],
##D   colvar = rad$direct / 1000,
##D   scale = FALSE,
##D   theta = 55,
##D   pch = 20,
##D   cex = 1.35,
##D   clab = expression(paste("kWh / ", m^2)),
##D   main = "Direct radiation"
##D )
##D scatter3D(
##D   x = coordinates(grid)[, 1],
##D   y = coordinates(grid)[, 2],
##D   z = coordinates(grid)[, 3],
##D   colvar = rad$diffuse / 1000,
##D   scale = FALSE,
##D   theta = 55,
##D   pch = 20,
##D   cex = 1.35,
##D   clab = expression(paste("kWh / ", m^2)),
##D   main = "Diffuse radiation"
##D )
##D scatter3D(
##D   x = coordinates(grid)[, 1],
##D   y = coordinates(grid)[, 2],
##D   z = coordinates(grid)[, 3],
##D   colvar = rad$total / 1000,
##D   scale = FALSE,
##D   theta = 55,
##D   pch = 20,
##D   cex = 1.35,
##D   clab = expression(paste("kWh / ", m^2)),
##D   main = "Total radiation"
##D )
##D 
##D par(opar)
## End(Not run)



