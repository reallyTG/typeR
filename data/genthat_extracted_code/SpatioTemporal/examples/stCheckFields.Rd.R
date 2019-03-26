library(SpatioTemporal)


### Name: stCheckFields
### Title: Test if fields exist in an object.
### Aliases: stCheckFields

### ** Examples

  ##load data
  data(mesa.model)
  ##names present in dta
  names(mesa.model$locations)

  ##check for some names
  stCheckFields(mesa.model$locations, c("ID","x","lat"))
  ##check for non-existant names
  try( stCheckFields(mesa.model$locations, c("ID","x","test")) )




