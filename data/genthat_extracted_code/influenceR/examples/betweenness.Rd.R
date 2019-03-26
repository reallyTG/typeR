library(influenceR)


### Name: betweenness
### Title: Vertex Betweenness centrality measure.
### Aliases: betweenness

### ** Examples

ig.ex <- igraph::erdos.renyi.game(100, p.or.m=0.3) # generate an undirected 'igraph' object
betweenness(ig.ex) # betweenness scores for each node in the graph



