library(geometa)


### Name: ISOVectorSpatialRepresentation
### Title: ISOVectorSpatialRepresentation
### Aliases: ISOVectorSpatialRepresentation
### Keywords: ISO address

### ** Examples

  md <- ISOVectorSpatialRepresentation$new()
  md$setTopologyLevel("geometryOnly")
  geomObject1 <- ISOGeometricObjects$new()
  geomObject1$setGeometricObjectType("surface")
  geomObject1$setGeometricObjectCount(5L)
  md$addGeometricObjects(geomObject1)
  xml <- md$encode()
  



