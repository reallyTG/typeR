library(funcy)


### Name: relabel
### Title: Relabel cluster IDs.
### Aliases: relabel relabelMethods

### ** Examples

##Generate dataset
k <- 6
set.seed(2004)
ds <- sampleFuncy(obsNr=50, timeNrMin=3, timeNrMax=10, reg=FALSE, k=k, sd=.5)

##Cluster with different methods
res1 <- funcit(methods="fitfclust", data=Data(ds), k=k, reg=FALSE)
res2 <- funcit(methods="iterSubspace", data=Data(ds), k=k, reg=FALSE)
res3 <- funcit(methods="distclust", data=Data(ds), k=k, reg=FALSE)

##Relabel two configurations
relabel(Cluster(res3),Cluster(res1),Center(res3),Center(res1))

##Make matrix of clutser configurations
cls <- cbind(Cluster(res1),Cluster(res2),Cluster(res3))
##Make list of Centers
ctrs <- list(Center(res1), Center(res2), Center(res3))

##Relabel cluster configurations
rel <- relabelMethods(cls=cls, ctrs=ctrs)

##Compare
cls
rel$allClusters




