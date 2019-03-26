library(caret)


### Name: prcomp.resamples
### Title: Principal Components Analysis of Resampling Results
### Aliases: prcomp.resamples cluster.resamples cluster
###   plot.prcomp.resamples
### Keywords: hplot

### ** Examples


## Not run: 
##D #load(url("http://topepo.github.io/caret/exampleModels.RData"))
##D 
##D resamps <- resamples(list(CART = rpartFit,
##D                           CondInfTree = ctreeFit,
##D                           MARS = earthFit))
##D resampPCA <- prcomp(resamps)
##D 
##D resampPCA
##D 
##D plot(resampPCA, what = "scree")
##D 
##D plot(resampPCA, what = "components")
##D 
##D plot(resampPCA, what = "components", dims = 2, auto.key = list(columns = 3))
##D 
##D clustered <- cluster(resamps)
##D plot(clustered)
##D 
## End(Not run)



