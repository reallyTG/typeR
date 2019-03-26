library(igraph)


### Name: articulation_points
### Title: Articulation points of a graph
### Aliases: articulation_points articulation.points
### Keywords: graphs

### ** Examples


g <- disjoint_union( make_full_graph(5), make_full_graph(5) )
clu <- components(g)$membership
g <- add_edges(g, c(match(1, clu), match(2, clu)) )
articulation_points(g)



