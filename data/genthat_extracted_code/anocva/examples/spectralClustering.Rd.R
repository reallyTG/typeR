library(anocva)


### Name: spectralClustering
### Title: Spectral clustering
### Aliases: spectralClustering

### ** Examples

# Install igraph if necessary
# install.packages('igraph')
# install.packages('cluster')

library(anocva)

set.seed(2000)

if (requireNamespace("igraph", quietly = TRUE)) {

  # Create a tree graph
  treeGraph = igraph::make_tree(80, children = 4, mode = "undirected")

  # Visualize the tree graph
  plot(treeGraph, vertex.size = 10, vertex.label = NA)

  # Get the adjacency matrix of the tree graph
  adj = as.matrix(igraph::get.adjacency(treeGraph))

  # Cluster the tree graph in to four clusters
  cluster = spectralClustering(adj, 4)

  # See the result clustering
  plot(treeGraph, vertex.size=10, vertex.color = cluster, vertex.label = NA)
}




