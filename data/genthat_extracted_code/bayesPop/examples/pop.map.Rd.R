library(bayesPop)


### Name: pop.map
### Title: World Map of Population Measures
### Aliases: pop.map get.pop.map.parameters pop.map.gvis
### Keywords: hplot

### ** Examples

## Not run: 
##D ##########################
##D # This example only makes sense if there is a simulation 
##D # for all countries. Below, only two countries are included,
##D # so the map is useless.
##D ##########################
##D sim.dir <- file.path(find.package("bayesPop"), "ex-data", "Pop")
##D pred <- get.pop.prediction(sim.dir=sim.dir, write.to.cache=FALSE)
##D # Uses heat colors with seven categories by default
##D pop.map(pred, sex="female", age=4:10)
##D # Female population in child-bearing age as a proportion of totals
##D pop.map(pred, expression="PXXX_F[4:10] / PXXX")
##D # The same with more colors
##D params <- get.pop.map.parameters(pred, expression="PXXX_F[4:10] / PXXX")
##D do.call("pop.map", params)
##D # Another projection year on the same color scale
##D do.call("pop.map", c(list(year=2043), params))
##D # Potential support ratio using googleVis
##D pop.map.gvis(pred, expression="PXXX[5:13] / PXXX[14:27]")
## End(Not run)	



