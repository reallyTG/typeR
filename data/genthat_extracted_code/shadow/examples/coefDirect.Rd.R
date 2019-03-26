library(shadow)


### Name: coefDirect
### Title: Coefficient of Direct Normal Irradiance reduction
### Aliases: coefDirect

### ** Examples

# Basic usage
coefDirect(type = "facade", facade_az = 180, solar_pos = matrix(c(210, 30), ncol = 2))

# Demonstration - Direct beam radiation coefficient on 'facades'
sun_az = seq(270, 90, by = -5)
sun_elev = seq(0, 90, by = 5)
solar_pos = expand.grid(sun_az = sun_az, sun_elev = sun_elev)
solar_pos$coef = coefDirect(type = "facade", facade_az = 180, solar_pos = as.matrix(solar_pos))[1, ]
coef = reshape2::acast(solar_pos, sun_az ~ sun_elev, value.var = "coef")
image(
  180 - sun_az, sun_elev, coef,
  col = rev(heat.colors(10)),
  breaks = seq(0, 1, 0.1),
  asp = 1,
  xlab = "Facade azimuth - Sun azimuth (deg)",
  ylab = "Sun elevation (deg)",
  main = "Facade - Coefficient of Direct Normal Irradiance"
)
contour(180 - sun_az, sun_elev, coef, add = TRUE)

# Demonstration - Direct beam radiation coefficient on 'roofs'
solar_pos$coef = coefDirect(type = "roof", facade_az = 180, solar_pos = as.matrix(solar_pos))[1, ]
coef = reshape2::acast(solar_pos, sun_az ~ sun_elev, value.var = "coef")
image(
  180 - sun_az, sun_elev, coef,
  col = rev(heat.colors(10)),
  breaks = seq(0, 1, 0.1),
  asp = 1,
  xlab = "Facade azimuth - Sun azimuth (deg)",
  ylab = "Sun elevation (deg)",
  main = "Roof - Coefficient of Direct Normal Irradiance"
)
contour(180 - sun_az, sun_elev, coef, add = TRUE)



