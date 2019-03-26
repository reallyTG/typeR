library(RgoogleMaps)


### Name: NYleukemia
### Title: Upstate New York Leukemia Data
### Aliases: NYleukemia
### Keywords: datasets

### ** Examples

data(NYleukemia)
  population <- NYleukemia$data$population
  cases <- NYleukemia$data$cases
  mapNY <- GetMap(center=c(lon=-76.00365, lat=42.67456), destfile = "NYstate.png",
  maptype = "mobile", zoom=9)
  ColorMap(100*cases/population, mapNY, NYleukemia$spatial.polygon, add = FALSE,
  alpha = 0.35, log = TRUE, location = "topleft")
 



