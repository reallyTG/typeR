library(MixAll)


### Name: plot,ClusterGamma-method
### Title: Plotting of a class ['ClusterGamma']
### Aliases: plot,ClusterGamma-method plot-ClusterGamma,
###   ClusterGamma-method

### ** Examples

  ## for quantitative case
## Not run: 
##D   data(iris)
##D   model <- clusterGamma( data=iris[1:4], nbCluster=3
##D                        , models=clusterGammaNames(prop = "equal")
##D                        , strategy = clusterFastStrategy())
##D   plot(model)
##D   plot(model, c(1,3))
##D   plot(model, c("Sepal.Length","Sepal.Width"))
##D   
## End(Not run)




