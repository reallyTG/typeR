library(mclust)


### Name: gmmhd
### Title: Identifying Connected Components in Gaussian Finite Mixture
###   Models for Clustering
### Aliases: gmmhd print.gmmhd summary.gmmhd print.summary.gmmhd plot.gmmhd
###   gmmhdClusterCores gmmhdClassify
### Keywords: cluster

### ** Examples

## Not run: 
##D data(faithful)
##D mod <- Mclust(faithful)
##D summary(mod)
##D plot(as.densityMclust(mod), faithful, what = "density", 
##D      points.pch = mclust.options("classPlotSymbols")[mod$classification], 
##D      points.col = mclust.options("classPlotColors")[mod$classification])
##D 
##D GMMHD <- gmmhd(mod)
##D summary(GMMHD)
##D 
##D plot(GMMHD, what = "mode")
##D plot(GMMHD, what = "cores")
##D plot(GMMHD, what = "clusters")
## End(Not run)



