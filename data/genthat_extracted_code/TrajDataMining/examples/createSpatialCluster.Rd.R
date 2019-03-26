library(TrajDataMining)


### Name: createSpatialCluster
### Title: Create Spatial Cluster
### Aliases: createSpatialCluster createSpatialCluster,Track,list-method

### ** Examples


spcluster<-createSpatialCluster(A1,speedCluster(A1,mean(A1@connections$speed),
12,min(A1@connections$speed)+4))




