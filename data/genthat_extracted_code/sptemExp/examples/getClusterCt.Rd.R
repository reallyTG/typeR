library(sptemExp)


### Name: getClusterCt
### Title: Retrieve the Central Coordinates for Each Cluser after
###   Clustering Done.
### Aliases: getClusterCt
### Keywords: ~cluster ~union-find

### ** Examples

samplePnt=data.frame(x=runif(100,1,100),y=runif(100,1,100))
clusterId=exeCluster(samplePnt,10)
clscenters=getClusterCt(samplePnt,clusterId)



