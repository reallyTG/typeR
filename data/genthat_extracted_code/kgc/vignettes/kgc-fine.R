## ---- message=FALSE, warning=FALSE---------------------------------------
library("kgc")
print(head(kgcities))

  # Query Course Resolution
  data <- data.frame(kgcities, rndCoord.lon = RoundCoordinates(kgcities$lon), rndCoord.lat = RoundCoordinates(kgcities$lat))
  data <- data.frame(data,CZ.c=LookupCZ(data))
  colnames(data)[which(colnames(data)=='rndCoord.lon')] <- 'rndCoord.lon.course'
  colnames(data)[which(colnames(data)=='rndCoord.lat')] <- 'rndCoord.lat.course'

  # Query Fine Resolution
  data <- data.frame(data, rndCoord.lon = RoundCoordinates(kgcities$lon,res='fine',latlong='lon'), rndCoord.lat = RoundCoordinates(kgcities$lat,res='fine',latlong='lat'))
  data <- data.frame(data,CZ.f=LookupCZ(data,res='fine'))

  # Print Results
  print(data[,c(1,3,8,11)])


