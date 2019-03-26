library(geometa)


### Name: ISOReferenceSystem
### Title: ISOReferenceSystem
### Aliases: ISOReferenceSystem
### Keywords: ISO reference system

### ** Examples

  md <- ISOReferenceSystem$new()
  rsId <- ISOReferenceIdentifier$new(code = "4326", codeSpace = "EPSG")
  md$setReferenceSystemIdentifier(rsId)
  xml <- md$encode()
  



