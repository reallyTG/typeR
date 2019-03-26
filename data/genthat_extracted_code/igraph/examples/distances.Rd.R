library(igraph)


### Name: distance_table
### Title: Shortest (directed or undirected) paths between vertices
### Aliases: distance_table mean_distance distances shortest.paths
###   get.shortest.paths get.all.shortest.paths mean_distance
###   distance_table average.path.length path.length.hist
###   all_shortest_paths shortest_paths shortest_paths all_shortest_paths
### Keywords: graphs

### ** Examples


g <- make_ring(10)
distances(g)
shortest_paths(g, 5)
all_shortest_paths(g, 1, 6:8)
mean_distance(g)
## Weighted shortest paths
el <- matrix(nc=3, byrow=TRUE,
             c(1,2,0, 1,3,2, 1,4,1, 2,3,0, 2,5,5, 2,6,2, 3,2,1, 3,4,1,
               3,7,1, 4,3,0, 4,7,2, 5,6,2, 5,8,8, 6,3,2, 6,7,1, 6,9,1,
               6,10,3, 8,6,1, 8,9,1, 9,10,4) )
g2 <- add_edges(make_empty_graph(10), t(el[,1:2]), weight=el[,3])
distances(g2, mode="out")




