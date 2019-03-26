library(RcmdrMisc)


### Name: assignCluster
### Title: Append a Cluster Membership Variable to a Dataframe
### Aliases: assignCluster
### Keywords: misc

### ** Examples

  data(USArrests)
  USArrkm3 <- KMeans(USArrests[USArrests$UrbanPop<66, ], centers=3)
  assignCluster(USArrests[USArrests$UrbanPop<66, ], USArrests, USArrkm3$cluster)



