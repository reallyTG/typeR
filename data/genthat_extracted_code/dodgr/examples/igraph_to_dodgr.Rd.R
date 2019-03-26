library(dodgr)


### Name: igraph_to_dodgr
### Title: igraph_to_dodgr
### Aliases: igraph_to_dodgr

### ** Examples

graph <- weight_streetnet (hampi)
graphi <- dodgr_to_igraph (graph)
graph2 <- igraph_to_dodgr (graphi)
identical (graph2, graph) # FALSE



