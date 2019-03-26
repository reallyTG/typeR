library(HDclust)


### Name: hmmvbClust
### Title: Cluster data with HMM-VB
### Aliases: hmmvbClust

### ** Examples

# cluster using trained HMM-VB
Vb <- vb(1, dim=4, numst=2)
set.seed(12345)
hmmvb <- hmmvbTrain(iris[,1:4], VbStructure=Vb)
clust <- hmmvbClust(iris[,1:4], model=hmmvb)
show(clust)
pairs(iris[,1:4], col=getClsid(clust))

## No test: 
# cluster using HMMVBBIC object obtained in model selection
Vb <- vb(1, dim=4, numst=1)
set.seed(12345)
modelBIC <- hmmvbBIC(iris[,1:4], VbStructure=Vb)
clust <- hmmvbClust(iris[,1:4], bicObj=modelBIC)
show(clust)
pairs(iris[,1:4], col=getClsid(clust))
## End(No test)



