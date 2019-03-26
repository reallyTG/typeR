library(statGraph)


### Name: graph.test
### Title: Test for the Jensen-Shannon divergence between graphs
### Aliases: graph.test
### Keywords: graph_comparison

### ** Examples

library(igraph)
x <- y <- list()
for (i in 1:20)
   x[[i]] <- as.matrix(get.adjacency(erdos.renyi.game(50, p=0.5)))
for (i in 1:20)
   y[[i]] <- as.matrix(get.adjacency(erdos.renyi.game(50, p=0.51)))

result <- graph.test(x, y, numBoot=100)
result




