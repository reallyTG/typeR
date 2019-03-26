library(GAS)


### Name: MultiGASRoll
### Title: Rolling forecast with multivariate GAS models
### Aliases: MultiGASRoll

### ** Examples

## Not run: 
##D # Specify a GAS model with Multivariate Student-t conditional
##D # distribution and time-varying scale and correlation parameters
##D 
##D # stock returns Forecast
##D 
##D data("StockIndices")
##D 
##D mY = StockIndices[, 1:2]
##D 
##D # Specification mvt
##D GASSpec = MultiGASSpec(Dist = "mvt", ScalingType = "Identity",
##D                        GASPar = list(location = FALSE, scale = TRUE,
##D                                      correlation = TRUE, shape = FALSE))
##D 
##D # Perform 1-step ahead rolling forecast with refit
##D library(parallel)
##D 
##D Roll = MultiGASRoll(mY, GASSpec, ForecastLength = 250,
##D                        RefitEvery = 100, RefitWindow = c("moving"))
##D 
##D Roll
## End(Not run)



