library(CrossClustering)


### Name: consensus_cluster
### Title: Get clusters which reach max consensus
### Aliases: consensus_cluster

### ** Examples

library(CrossClustering)

data(toy)

### toy is transposed as we want to cluster samples (columns of the
### original matrix)
toy_dist <- t(toy) %>% dist(method = "euclidean")

### Hierarchical clustering
cluster_ward    <- toy_dist %>% hclust(method = "ward.D")
cluster_other <- toy_dist %>% hclust(method = "complete")


### consensus_cluster
CrossClustering:::consensus_cluster(c(3, 4),
  cluster_ward,
  cluster_other
)




