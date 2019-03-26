library(GAS)


### Name: BacktestDensity
### Title: Backtest a series of one-step ahead density predictions.
### Aliases: BacktestDensity

### ** Examples

## Not run: 
##D data("cpichg")
##D 
##D GASSpec = UniGASSpec(Dist = "std", ScalingType = "Identity",
##D                        GASPar = list(location = TRUE, scale = TRUE,
##D                                       shape = FALSE))
##D 
##D Roll = UniGASRoll(cpichg, GASSpec, ForecastLength = 50,
##D                   RefitEvery = 10, RefitWindow = c("moving"))
##D 
##D BackTest = BacktestDensity(Roll, lower = -100, upper = 100)
##D 
##D BackTest$average
## End(Not run)



