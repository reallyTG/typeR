library(geometa)


### Name: ISOGridSpatialRepresentation
### Title: ISOGridSpatialRepresentation
### Aliases: ISOGridSpatialRepresentation
### Keywords: ISO grid representation spatial

### ** Examples

  md <- ISOGridSpatialRepresentation$new()
  md$setNumberOfDimensions(1)
  dim1 <- ISODimension$new()
  dim1$setName("row")
  dim1$setSize(100)
  dim1$setResolution(ISOMeasure$new(value=1,uom="m"))
  md$addDimension(dim1)
  md$setCellGeometry("area")
  xml <- md$encode()




