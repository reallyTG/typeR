library(clusteval)


### Name: clustomit
### Title: ClustOmit - Cluster Stability Evaluation via Cluster Omission
### Aliases: clustomit

### ** Examples

# First, we create a wrapper function for the K-means clustering algorithm
# that returns only the clustering labels for each observation (row) in
# \code{x}.
kmeans_wrapper <- function(x, num_clusters, num_starts = 10, ...) {
  kmeans(x = x, centers = num_clusters, nstart = num_starts, ...)$cluster
}

# For this example, we generate five multivariate normal populations with the
# \code{sim_data} function.
x <- sim_data("normal", delta = 1.5, seed = 42)$x

clustomit_out <- clustomit(x = x, num_clusters = 4,
                           cluster_method = "kmeans_wrapper", num_cores = 1)
clustomit_out2 <- clustomit(x = x, num_clusters = 5,
                            cluster_method = kmeans_wrapper, num_cores = 1)



