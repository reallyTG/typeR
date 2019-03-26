library(netrankr)


### Name: neighborhood_inclusion
### Title: Neighborhood-inclusion preorder
### Aliases: neighborhood_inclusion

### ** Examples

library(igraph)
#the neighborhood inclusion preorder of a star graph is complete
g <- graph.star(5,'undirected')
P <- neighborhood_inclusion(g)
comparable_pairs(P)

#the same holds for threshold graphs
tg <- threshold_graph(50,0.1)
P <- neighborhood_inclusion(tg)
comparable_pairs(P)

#standard centrality indices preserve neighborhood-inclusion
g <- graph.empty(n=11,directed = FALSE)
g <- add_edges(g,c(1,11,2,4,3,5,3,11,4,8,5,9,5,11,6,7,6,8,
                   6,10,6,11,7,9,7,10,7,11,8,9,8,10,9,10))
P <- neighborhood_inclusion(g)

is_preserved(P,degree(g))
is_preserved(P,closeness(g))
is_preserved(P,betweenness(g))



