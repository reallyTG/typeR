library(igraph)


### Name: igraph-es-attributes
### Title: Query or set attributes of the edges in an edge sequence
### Aliases: igraph-es-attributes [[<-.igraph.es igraph-es-attributes
###   [<-.igraph.es igraph-es-attributes $.igraph.es igraph-es-attributes
###   $<-.igraph.es igraph-es-attributes E<-

### ** Examples

# color edges of the largest component
largest_comp <- function(graph) {
  cl <- components(graph)
  V(graph)[which.max(cl$csize) == cl$membership]
}
g <- sample_(gnp(100, 1/100),
  with_vertex_(size = 3, label = ""),
  with_graph_(layout = layout_with_fr)
)
giant_v <- largest_comp(g)
E(g)$color <- "orange"
E(g)[giant_v %--% giant_v]$color <- "blue"
plot(g)



