library(igraph)


### Name: neighbors
### Title: Neighboring (adjacent) vertices in a graph
### Aliases: neighbors

### ** Examples

g <- make_graph("Zachary")
n1 <- neighbors(g, 1)
n34 <- neighbors(g, 34)
intersection(n1, n34)



