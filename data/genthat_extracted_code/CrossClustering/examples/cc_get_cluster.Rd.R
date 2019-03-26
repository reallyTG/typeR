library(CrossClustering)


### Name: cc_get_cluster
### Title: Provides the vector of clusters' ID to which each element belong
###   to.
### Aliases: cc_get_cluster cc_get_cluster.default
###   cc_get_cluster.crossclustering

### ** Examples

library(CrossClustering)

data(toy)

### toy is transposed as we want to cluster samples (columns of the
### original matrix)
toy_dist <- t(toy) %>% dist(method = "euclidean")

### Run CrossClustering
toyres <- cc_crossclustering(toy_dist,
  k_w_min = 2,
  k_w_max = 5,
  k2_max  = 6,
  out     = TRUE
)

### cc_get_cluster
cc_get_cluster(toyres[], 7)


### cc_get_cluster directly from a crossclustering object
cc_get_cluster(toyres)



