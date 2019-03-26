library(clusterSim)


### Name: plotInterval
### Title: Plot symbolic interval-valued data on a scatterplot matrix
### Aliases: plotInterval
### Keywords: hplot

### ** Examples

# Example 1
library(clusterSim)
data(data_symbolic)
plotInterval(data_symbolic, pairsofsVar=c(1,3,4,6), cl=NULL,
clColors=NULL)

# Example 2
library(clusterSim)
grnd <- cluster.Gen(60, model=5, dataType="s", numNoisyVar=1, 
numOutliers=10, rangeOutliers=c(1,5))
grnd$clusters[grnd$clusters==0] <- max(grnd$clusters)+1			
# To colour outliers
plotInterval(grnd$data, pairsofsVar=NULL, cl=grnd$clusters,
clColors=TRUE)

# Example 3
library(clusterSim)
grnd <- cluster.Gen(50, model=4, dataType="s", numNoisyVar=2, 
numOutliers=10, rangeOutliers=c(1,4))
grnd$clusters[grnd$clusters==0] <- max(grnd$clusters)+1			
# To colour outliers
plotInterval(grnd$data, pairsofsVar=NULL, cl=grnd$clusters, 
clColors=c("red","blue","green","yellow"))



