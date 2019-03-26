library(bayesLife)


### Name: e0.map
### Title: World Map of the Life Expectancy
### Aliases: e0.map e0.map.all get.e0.map.parameters e0.map.gvis
### Keywords: hplot

### ** Examples

## Not run: 
##D sim.dir <- file.path(find.package("bayesLife"), "ex-data", "bayesLife.output")
##D pred <- get.e0.prediction(sim.dir=sim.dir)
##D # Uses heat colors and seven categories by default
##D e0.map(pred)
##D # Uses more colors with more suitable categorization
##D params <- get.e0.map.parameters(pred)
##D do.call('e0.map', params)
##D # Another projection year on the same scale
##D do.call('e0.map', c(list(year=2043), params))
## End(Not run)



