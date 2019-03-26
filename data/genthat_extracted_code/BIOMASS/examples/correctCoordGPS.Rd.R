library(BIOMASS)


### Name: correctCoordGPS
### Title: Correct the GPS coordinates
### Aliases: correctCoordGPS

### ** Examples

projCoord <- data.frame(
  X = c(
    runif(5, min = 9, max = 11), runif(5, min = 8, max = 12),
    runif(5, min = 80, max = 120), runif(5, min = 90, max = 110)
  ),
  Y = c(
    runif(5, min = 9, max = 11), runif(5, min = 80, max = 120),
    runif(5, min = 8, max = 12), runif(5, min = 90, max = 110)
  )
)
projCoord <- projCoord + 1000
coordRel <- data.frame(
  X = c(rep(0, 10), rep(100, 10)),
  Y = c(rep(c(rep(0, 5), rep(100, 5)), 2))
)

aa <- correctCoordGPS(
  projCoord = projCoord, coordRel = coordRel,
  rangeX = c(0, 100), rangeY = c(0, 100)
)
bb <- correctCoordGPS(
  projCoord = projCoord, coordRel = coordRel,
  rangeX = c(0, 100), rangeY = c(0, 100), rmOutliers = TRUE
)
## Not run: 
##D correctCoordGPS(
##D   projCoord = projCoord, coordRel = coordRel,
##D   rangeX = c(0, 100), rangeY = c(0, 100), drawPlot = TRUE
##D )
## End(Not run)




