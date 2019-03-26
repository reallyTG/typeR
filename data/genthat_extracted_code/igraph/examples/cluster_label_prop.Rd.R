library(igraph)


### Name: cluster_label_prop
### Title: Finding communities based on propagating labels
### Aliases: cluster_label_prop label.propagation.community
### Keywords: graphs

### ** Examples


  g <- sample_gnp(10, 5/10) %du% sample_gnp(9, 5/9)
  g <- add_edges(g, c(1, 12))
  cluster_label_prop(g)




