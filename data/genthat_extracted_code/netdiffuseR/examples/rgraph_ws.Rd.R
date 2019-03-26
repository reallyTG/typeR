library(netdiffuseR)


### Name: rgraph_ws
### Title: Watts-Strogatz model
### Aliases: rgraph_ws small-world

### ** Examples


library(igraph)
set.seed(7123)
x0 <- graph_from_adjacency_matrix(rgraph_ws(10,2, 0))
x1 <- graph_from_adjacency_matrix(rgraph_ws(10,2, .3))
x2 <- graph_from_adjacency_matrix(rgraph_ws(10,2, 1))

oldpar <- par(no.readonly=TRUE)
par(mfrow=c(1,3))
plot(x0, layout=layout_in_circle, edge.curved=TRUE, main="Regular")
plot(x1, layout=layout_in_circle, edge.curved=TRUE, main="Small-world")
plot(x2, layout=layout_in_circle, edge.curved=TRUE, main="Random")
par(oldpar)




