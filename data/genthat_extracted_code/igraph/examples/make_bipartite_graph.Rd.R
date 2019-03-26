library(igraph)


### Name: is_bipartite
### Title: Create a bipartite graph
### Aliases: is_bipartite make_bipartite_graph graph.bipartite is.bipartite
###   is_bipartite bipartite_graph
### Keywords: graphs

### ** Examples


g <- make_bipartite_graph( rep(0:1,length=10), c(1:10))
print(g, v=TRUE)




