library(igraph)


### Name: cluster_spinglass
### Title: Finding communities in graphs based on statistical meachanics
### Aliases: cluster_spinglass spinglass.community
### Keywords: graphs

### ** Examples


  g <- sample_gnp(10, 5/10) %du% sample_gnp(9, 5/9)
  g <- add_edges(g, c(1, 12))
  g <- induced_subgraph(g, subcomponent(g, 1))
  cluster_spinglass(g, spins=2)
  cluster_spinglass(g, vertex=1)




