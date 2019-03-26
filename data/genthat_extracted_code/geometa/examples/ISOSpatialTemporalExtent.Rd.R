library(geometa)


### Name: ISOSpatialTemporalExtent
### Title: ISOSpatialTemporalExtent
### Aliases: ISOSpatialTemporalExtent
### Keywords: ISO extent spatialtemporal

### ** Examples

  #create object
  md <- ISOSpatialTemporalExtent$new()
  start <- ISOdate(2000, 1, 12, 12, 59, 45)
  end <- ISOdate(2010, 8, 22, 13, 12, 43)
  tp <- GMLTimePeriod$new(beginPosition = start, endPosition = end)
  md$setTimePeriod(tp)
  spatialExtent <- ISOGeographicBoundingBox$new(minx = -180, miny = -90, maxx = 180, maxy = 90)
  md$setSpatialExtent(spatialExtent)
  
  xml <- md$encode()
  



