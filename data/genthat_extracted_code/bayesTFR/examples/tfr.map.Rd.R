library(bayesTFR)


### Name: tfr.map
### Title: TFR World Map
### Aliases: tfr.map tfr.map.all get.tfr.map.parameters tfr.map.gvis
### Keywords: hplot

### ** Examples

## Not run: 
##D sim.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")
##D pred <- get.tfr.prediction(sim.dir=sim.dir)
##D # Uses heat colors and seven categories by default
##D tfr.map(pred)
##D # Uses more colors with more suitable categorization
##D params <- get.tfr.map.parameters(pred)
##D do.call("tfr.map", params)
##D # Another projection year on the same scale
##D do.call("tfr.map", c(list(year=2043), params))
##D 
##D # Using Google Vizualization tool
##D tfr.map.gvis(pred)
## End(Not run)



