library(igraph)


### Name: igraph-vs-attributes
### Title: Query or set attributes of the vertices in a vertex sequence
### Aliases: igraph-vs-attributes [[<-.igraph.vs igraph-vs-attributes
###   [<-.igraph.vs igraph-vs-attributes $.igraph.vs igraph-vs-attributes
###   $<-.igraph.vs igraph-vs-attributes V<-

### ** Examples

g <- make_(ring(10),
  with_vertex_(
    name = LETTERS[1:10],
    color = sample(1:2, 10, replace=TRUE)
  )
)
V(g)$name
V(g)$color
V(g)$frame.color <- V(g)$color

# color vertices of the largest component
largest_comp <- function(graph) {
  cl <- components(graph)
  V(graph)[which.max(cl$csize) == cl$membership]
}
g <- sample_(gnp(100, 2/100),
  with_vertex_(size = 3, label = ""),
  with_graph_(layout = layout_with_fr)
)
giant_v <- largest_comp(g)
V(g)$color <- "blue"
V(g)[giant_v]$color <- "orange"
plot(g)



