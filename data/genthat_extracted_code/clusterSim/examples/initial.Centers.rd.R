library(clusterSim)


### Name: initial.Centers
### Title: Calculation of initial clusters centers for k-means like
###   alghoritms
### Aliases: initial.Centers
### Keywords: cluster

### ** Examples

#Example 1 (numbers of objects choosen as initial cluster centers)
library(clusterSim)
data(data_ratio)
ic <- initial.Centers(data_ratio, 10)
print(ic)

#Example 2 (application with kmeans algorithm)
library(clusterSim)
data(data_ratio)
kmeans(data_ratio,data_ratio[initial.Centers(data_ratio, 10),]) 




