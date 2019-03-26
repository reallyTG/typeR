library(SpatioTemporal)


### Name: stCheckSTcovars
### Title: Check an Array/List of Spatio-Temporal Covariates
### Aliases: stCheckSTcovars

### ** Examples

  ##load data
  data(mesa.model)

  ##check covariates
  tmp <- stCheckSTcovars( mesa.model$ST.all, mesa.model$locations$ID )
  str(tmp)
  ##require non-existant site
  try( stCheckSTcovars( mesa.model$ST.all, "Bad.Site" ) )
  ##require non-existant site
  try( stCheckSTcovars( mesa.model$ST.all, date.unique=1 ) )




