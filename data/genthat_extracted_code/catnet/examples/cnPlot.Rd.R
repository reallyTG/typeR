library(catnet)


### Name: cnPlot-method
### Title: Plot Network
### Aliases: cnPlot cnPlot,catNetwork-method
###   cnPlot,catNetworkEvaluate-method
### Keywords: methods graphs aplot

### ** Examples

  ## Set R_CATNET_USE_IGRAPH to TRUE if you want to use 'igraph'
  Sys.setenv(R_CATNET_USE_IGRAPH=FALSE)
  cnet <- cnRandomCatnet(numnodes=10, maxParents=3, numCategories=2)
  cnPlot(object=cnet)



