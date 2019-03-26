library(tightClust)


### Name: tight.clust
### Title: Tight Clustering
### Aliases: tight.clust
### Keywords: cluster

### ** Examples

## load the test dataset
data(tclust.test.data)
## find 10 tight clusters
ptm<-proc.time()
## k.min=25, tighter clusters will be found
## target=1 is used to save time, target=10 is recommended
tclust1<-tight.clust(tclust.test.data$Data, target=1, k.min=25, random.seed=12345)
proc.time()-ptm
## plot the heat map of cluster result
plot(tclust1)
## write the cluster result
write.tight.clust(tclust1)
ptm<-proc.time()
## k.min=10, looser clusters will be found
## target=1 is used to save time, target=5 is recommended
tclust2<-tight.clust(tclust.test.data$Data, target=1, k.min=10, random.seed=12345)
proc.time()-ptm
## plot the heat map of cluster result
plot(tclust2)
## write the cluster result
write.tight.clust(tclust2)



