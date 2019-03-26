library(MixAll)


### Name: ClusterStrategy
### Title: Constructor of ['ClusterStrategy'] class
### Aliases: ClusterStrategy ClusterStrategy-class

### ** Examples

  new("ClusterStrategy")
  shortAlgo=clusterAlgo("SEM",1000)
  longAlgo =clusterAlgo("SemiSEM",200,1e-07)
  new("ClusterStrategy", shortAlgo=shortAlgo, longAlgo=longAlgo)
  getSlots("ClusterStrategy")




