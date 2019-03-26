library(kgc)


### Name: LookupCZ
### Title: LookupCZ
### Aliases: LookupCZ

### ** Examples

data <- data.frame(Site = c("GC","UFS","NEG"),
  Longitude = c(-15.42,10.98,34.78),
  Latitude = c(27.82,47.42,30.86))
data <- data.frame(data,
  rndCoord.lon = RoundCoordinates(data$Longitude),
  rndCoord.lat = RoundCoordinates(data$Latitude))
data <- data.frame(data,ClimateZ=LookupCZ(data))



