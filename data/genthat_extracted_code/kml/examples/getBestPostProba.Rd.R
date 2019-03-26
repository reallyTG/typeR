library(kml)


### Name: getBestPostProba
### Title: ~ Function: getBestPostProba ~
### Aliases: getBestPostProba

### ** Examples

### Creation of an object ClusterLongData
myCld <- gald(20)

### Computation of some partition
kml(myCld,2:4,3)

### Extraction the best posterior probabilities
### form the list of partition with 3 clusters of the second clustering
getBestPostProba(myCld,3,2)



