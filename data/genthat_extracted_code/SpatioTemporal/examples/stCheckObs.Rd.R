library(SpatioTemporal)


### Name: stCheckObs
### Title: Check an 'obs' data.frame.
### Aliases: stCheckObs

### ** Examples

  ##load data
  data(mesa.model)

  ##check observations 
  stCheckObs( mesa.model$obs )
  ##some possible failures
  mesa.model$obs <- rbind(mesa.model$obs, mesa.model$obs[1,])
  try( stCheckObs( mesa.model$obs ) )
  mesa.model$obs$obs[1] <- NaN
  try( stCheckObs( mesa.model$obs ) )
  mesa.model$obs$date <- as.character( mesa.model$obs$date )
  try( stCheckObs( mesa.model$obs ) )
  mesa.model$obs$date <- NULL
  try( stCheckObs( mesa.model$obs ) )




