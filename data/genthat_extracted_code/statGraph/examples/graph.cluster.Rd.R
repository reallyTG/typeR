library(statGraph)


### Name: graph.cluster
### Title: Hierarchical cluster analysis on a list of graphs.
### Aliases: graph.cluster
### Keywords: clustering

### ** Examples

require(igraph)
g <- list()
for (i in 1:5) {
    g[[i]] <- as.matrix(get.adjacency(
                        erdos.renyi.game(50, 0.5, type="gnp",
                                         directed = FALSE)))
}
for (i in 6:10) {
    g[[i]] <- as.matrix(get.adjacency(
                        watts.strogatz.game(1, 50, 8, 0.2)))
}
for (i in 11:15) {
    g[[i]] <- as.matrix(get.adjacency(
                        barabasi.game(50, power = 1,
                                      directed = FALSE)))
}
graph.cluster(g, 3)




