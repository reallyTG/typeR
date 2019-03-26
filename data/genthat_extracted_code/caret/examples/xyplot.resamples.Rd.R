library(caret)


### Name: xyplot.resamples
### Title: Lattice Functions for Visualizing Resampling Results
### Aliases: xyplot.resamples densityplot.resamples bwplot.resamples
###   splom.resamples parallelplot.resamples dotplot.resamples
###   ggplot.resamples
### Keywords: hplot

### ** Examples


## Not run: 
##D #load(url("http://topepo.github.io/caret/exampleModels.RData"))
##D 
##D resamps <- resamples(list(CART = rpartFit,
##D                           CondInfTree = ctreeFit,
##D                           MARS = earthFit))
##D 
##D dotplot(resamps,
##D         scales =list(x = list(relation = "free")),
##D         between = list(x = 2))
##D 
##D bwplot(resamps,
##D        metric = "RMSE")
##D 
##D densityplot(resamps,
##D             auto.key = list(columns = 3),
##D             pch = "|")
##D 
##D xyplot(resamps,
##D        models = c("CART", "MARS"),
##D        metric = "RMSE")
##D 
##D splom(resamps, metric = "RMSE")
##D splom(resamps, variables = "metrics")
##D 
##D parallelplot(resamps, metric = "RMSE")
##D 
##D 
## End(Not run)




