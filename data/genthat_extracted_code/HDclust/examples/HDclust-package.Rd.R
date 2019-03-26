library(HDclust)


### Name: HDclust-package
### Title: Clustering high dimensional data with Hidden Markov Model on
###   Variable Blocks
### Aliases: HDclust-package HDclust

### ** Examples

data("sim3")
set.seed(12345)
Vb <- vb(2, dim=40, bdim=c(10,30), numst=c(3,5), varorder=list(c(1:10),c(11:40)))
hmmvb <- hmmvbTrain(sim3[,1:40], VbStructure=Vb)
clust <- hmmvbClust(sim3[,1:40], model=hmmvb)
show(clust)



