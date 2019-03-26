library(streamMOA)


### Name: DSC_ClusTree
### Title: ClusTree Data Stream Clusterer
### Aliases: DSC_ClusTree ClusTree clustree

### ** Examples

# data with 3 clusters and 5% noise
stream <- DSD_Gaussians(k=3, d=2, noise=0.05)

clustree <- DSC_ClusTree(maxHeight=3)
update(clustree, stream, 500)
clustree

# plot micro-clusters
plot(clustree, stream)

# recluster with k-means
kmeans <- DSC_Kmeans(k=3)
recluster(kmeans, clustree)
plot(kmeans, stream, type="both")

# create a two stage clusering using ClusTree and reachability reclustering
CTxReach <- DSC_TwoStage(
  micro=DSC_ClusTree(maxHeight=3),
  macro=DSC_Reachability(epsilon = .15)
)
CTxReach
update(CTxReach, stream, 500)
plot(CTxReach, stream, type="both")



