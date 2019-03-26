library(SpatioTemporal)


### Name: stCheckCovars
### Title: Check a data.frame of Covariates
### Aliases: stCheckCovars

### ** Examples

  ##load data
  data(mesa.model)

  ##check covariates
  tmp <- stCheckCovars( mesa.model$locations, mesa.model$locations$ID )
  str(tmp)
  ##require non-existant site
  try( stCheckCovars( mesa.model$locations, "Bad.Site" ) )
  ##drop the ID
  mesa.model$locations$ID <- NULL
  tmp <- stCheckCovars( mesa.model$locations )
  ##ID:s infered from rownames (1-25)
  str(tmp)




