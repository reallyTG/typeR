library(CORElearn)


### Name: rfClustering
### Title: Random forest based clustering
### Aliases: rfClustering
### Keywords: cluster robust tree

### ** Examples

set<-iris
md<-CoreModel(Species ~ ., set, model="rf", rfNoTrees=30, maxThreads=1)
mdCluster<-rfClustering(md, 5)

destroyModels(md) # clean up




