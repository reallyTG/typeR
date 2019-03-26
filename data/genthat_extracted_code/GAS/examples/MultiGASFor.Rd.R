library(GAS)


### Name: MultiGASFor
### Title: Forecast with multivariate GAS models
### Aliases: MultiGASFor mGASMultiForcast

### ** Examples

## Not run: 
##D # Specify a GAS model with multivatiate  Student-t conditional
##D # distribution and time-varying scales and correlations.
##D 
##D # Stock returns forecast
##D 
##D set.seed(123)
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
##D # Perform H-step ahead forecast with confidence bands
##D 
##D # Estimation
##D Fit = MultiGASFit(GASSpec, mY)
##D 
##D # Forecast
##D Forecast  = MultiGASFor(Fit, H = 50)
##D 
##D Forecast
##D 
##D # Perform 1-Step ahead rolling forecast
##D 
##D InSampleData  = mY[1:1000, ]
##D OutSampleData = mY[1001:2404, ]
##D 
##D # Estimation
##D Fit = MultiGASFit(GASSpec, InSampleData)
##D 
##D Forecast  = MultiGASFor(Fit, Roll = TRUE, out = OutSampleData)
##D 
##D Forecast
## End(Not run)



