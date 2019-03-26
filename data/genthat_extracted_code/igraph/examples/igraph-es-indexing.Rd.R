library(igraph)


### Name: igraph-es-indexing
### Title: Indexing edge sequences
### Aliases: igraph-es-indexing [.igraph.es %--% %<-% %->%

### ** Examples

# special operators for indexing based on graph structure
g <- sample_pa(100, power = 0.3)
E(g) [ 1:3 %--% 2:6 ]
E(g) [ 1:5 %->% 1:6 ]
E(g) [ 1:3 %<-% 2:6 ]

# the edges along the diameter
g <- sample_pa(100, directed = FALSE)
d <- get_diameter(g)
E(g, path = d)

# select edges based on attributes
g <- sample_gnp(20, 3/20) %>%
  set_edge_attr("weight", value = rnorm(gsize(.)))
E(g)[[ weight < 0 ]]



