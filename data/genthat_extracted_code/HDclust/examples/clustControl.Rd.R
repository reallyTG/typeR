library(HDclust)


### Name: clustControl
### Title: Parameters for MBM clustering algorithm.
### Aliases: clustControl

### ** Examples

# avoid clusters of size < 60
Vb <- vb(1, dim=4, numst=2)
set.seed(12345)
hmmvb <- hmmvbTrain(iris[,1:4], VbStructure=Vb)
clust <- hmmvbClust(iris[,1:4], model=hmmvb, control=clustControl(minSize=60))
show(clust)



