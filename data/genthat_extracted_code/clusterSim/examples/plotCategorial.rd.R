library(clusterSim)


### Name: plotCategorial
### Title: Plot categorial data on a scatterplot matrix
### Aliases: plotCategorial
### Keywords: hplot

### ** Examples

# Example 1
library(clusterSim)
data(data_ordinal)
plotCategorial(data_ordinal, pairsofVar=c(1,3,4,9), cl=NULL, 
clColors = NULL)

# Example 2
library(clusterSim)
grnd <- cluster.Gen(50,model=5,dataType="o",numCategories=5)
plotCategorial(grnd$data, pairsofVar=NULL, cl=grnd$clusters, 
clColors=TRUE)

# Example 3
library(clusterSim)
grnd<-cluster.Gen(50,model=4,dataType="o",numCategories=7, numNoisyVar=2)
plotCategorial(grnd$data, pairsofVar=NULL, cl=grnd$clusters, 
clColors = c("red","blue","green"))




