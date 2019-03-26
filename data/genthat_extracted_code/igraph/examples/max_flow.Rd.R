library(igraph)


### Name: max_flow
### Title: Maximum flow in a graph
### Aliases: max_flow graph.maxflow

### ** Examples


E <- rbind( c(1,3,3), c(3,4,1), c(4,2,2), c(1,5,1), c(5,6,2), c(6,2,10))
colnames(E) <- c("from", "to", "capacity")
g1 <- graph_from_data_frame(as.data.frame(E))
max_flow(g1, source=V(g1)["1"], target=V(g1)["2"])



