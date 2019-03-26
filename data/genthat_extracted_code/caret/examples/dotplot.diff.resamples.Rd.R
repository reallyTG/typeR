library(caret)


### Name: dotplot.diff.resamples
### Title: Lattice Functions for Visualizing Resampling Differences
### Aliases: dotplot.diff.resamples levelplot.diff.resamples
###   densityplot.diff.resamples bwplot.diff.resamples
### Keywords: hplot

### ** Examples


## Not run: 
##D #load(url("http://topepo.github.io/caret/exampleModels.RData"))
##D 
##D resamps <- resamples(list(CART = rpartFit,
##D                           CondInfTree = ctreeFit,
##D                           MARS = earthFit))
##D difs <- diff(resamps)
##D 
##D dotplot(difs)
##D 
##D densityplot(difs,
##D             metric = "RMSE",
##D             auto.key = TRUE,
##D             pch = "|")
##D 
##D bwplot(difs,
##D        metric = "RMSE")
##D 
##D levelplot(difs, what = "differences")
##D 
## End(Not run)




