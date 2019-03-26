library(overlap)


### Name: sunTime
### Title: Convert clock times to sun times
### Aliases: sunTime

### ** Examples

# Check that sp and maptools packages are installed
if(requireNamespace("sp") && requireNamespace("maptools")) { 
  # Get example data:
  data(simCalls)
  str(simCalls)

  # Convert dates to a POSIXct object with the right time zone (GMT): 
  Dates <- as.POSIXct(simCalls$dates, tz="GMT")

  # Create a SpatialPoints object with the location
  coords <- matrix(c(-3, 56), nrow=1)
  Coords <- sp::SpatialPoints(coords, proj4string=sp::CRS("+proj=longlat +datum=WGS84"))

  st <- sunTime(simCalls$time, Dates, Coords)

  par(mfrow=2:1)
  densityPlot(st, col='red', lwd=2, xaxt='n', main="Sun time")
  axis(1, at=c(0, 6, 12, 18, 24),
    labels=c("midnight", "sunrise", "noon", "sunset", "midnight"))
  densityPlot(simCalls$time, lwd=2, main="Clock time")
  par(mfrow=c(1,1))
}



