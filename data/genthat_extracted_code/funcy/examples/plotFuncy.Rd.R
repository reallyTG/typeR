library(funcy)


### Name: plotFuncy
### Title: Plot functional data.
### Aliases: plotFuncy plotFuncy,matrix-method plotFuncy,sampleFuncy-method
### Keywords: plot

### ** Examples

##cluster the data with methods for regular sets
##sample a regular dataset
set.seed(2001)
ds <- sampleFuncy(obsNr=40, k=4, timeNr=20, reg=TRUE)
data <- Data(ds)
clusters <- Cluster(ds)

##plot sampled functions. 
plotFuncy(data, col=clusters, lty=1, showLegend=TRUE, legendPlace="topleft")

##sample an irregular dataset
set.seed(2001)
ds <- sampleFuncy(obsNr=40, k=4, timeNrMin=2, timeNrMax=10, reg=FALSE)
data <- Data(ds)
clusters <- Cluster(ds)

##plot sampled functions. 
plotFuncy(data, col=clusters, lty=1, showLegend=TRUE, legendPlace="topleft")


##cluster functions with method fitfclust
res <- funcit(data=data, clusters=clusters,
              methods="fitfclust",
              k=4)

##plot including the centers
plotFuncy(data, col=clusters, ctr=Center(res), showLegend=TRUE, legendPlace="topleft")




