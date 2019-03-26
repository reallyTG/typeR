library(igraph)


### Name: igraph-vs-indexing
### Title: Indexing vertex sequences
### Aliases: igraph-vs-indexing [.igraph.vs

### ** Examples

# -----------------------------------------------------------------
# Setting attributes for subsets of vertices
largest_comp <- function(graph) {
  cl <- components(graph)
  V(graph)[which.max(cl$csize) == cl$membership]
}
g <- sample_(gnp(100, 2/100),
  with_vertex_(size = 3, label = ""),
  with_graph_(layout = layout_with_fr)
)
giant_v <- largest_comp(g)
V(g)$color <- "green"
V(g)[giant_v]$color <- "red"
plot(g)

# -----------------------------------------------------------------
# nei() special function
g <- graph( c(1,2, 2,3, 2,4, 4,2) )
V(g)[ .nei( c(2,4) ) ]
V(g)[ .nei( c(2,4), "in") ]
V(g)[ .nei( c(2,4), "out") ]

# -----------------------------------------------------------------
# The same with vertex names
g <- graph(~ A -+ B, B -+ C:D, D -+ B)
V(g)[ .nei( c('B', 'D') ) ]
V(g)[ .nei( c('B', 'D'), "in" ) ]
V(g)[ .nei( c('B', 'D'), "out" ) ]



