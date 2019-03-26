library(geometa)


### Name: GMLParameterValue
### Title: GMLParameterValue
### Aliases: GMLParameterValue
### Keywords: GML ISO parameter value

### ** Examples

  gml <- GMLParameterValue$new()
  gml$setValue(1.1, "test")
  op <- GMLOperationParameter$new()
  op$setDescriptionReference("someref")
  op$setIdentifier("identifier", "codespace")
  op$addName("name1", "codespace")
  op$addName("name2", "codespace")
  op$setMinimumOccurs(2L)
  gml$setOperationParameter(op)
  xml <- gml$encode()




