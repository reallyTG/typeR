library(dbscan)


### Name: NN
### Title: Nearest Neighbors Auxiliary Functions
### Aliases: adjacencylist adjacencylist.kNN adjacencylist.frNN plot.NN NN
###   nn
### Keywords: model

### ** Examples

data(iris)
x <- iris[, -5]

# finding kNN directly in data (using a kd-tree)
nn <- kNN(x, k=5)
nn

# plot the kNN where NN are shown as line conecting points.
plot(nn, x)

# show the first few elements of the adjacency list
head(adjacencylist(nn))

# create a graph and find connected components (if igraph is installed)
if("igraph" %in% installed.packages()){
  library("igraph")
  g <- graph_from_adj_list(adjacencylist(nn))
  comp <- components(g)
  plot(x, col = comp$membership)

  # detect clusters (communities) with the label propagation algorithm
  cl <- membership(cluster_label_prop(g))
  plot(x, col = cl)
}



