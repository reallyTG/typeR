library(kml)


### Name: getClusters
### Title: ~ Function: getClusters ~
### Aliases: getClusters

### ** Examples

### Creation of an object ClusterLongData
myCld <- gald(20)

### Computation of some partition
kml(myCld,2:4,3)

### Extraction form the list of partition with 3 clusters
###   of the second clustering
getClusters(myCld,3,2)



