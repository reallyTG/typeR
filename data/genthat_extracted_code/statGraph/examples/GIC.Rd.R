library(statGraph)


### Name: GIC
### Title: Graph Information Criterion (GIC)
### Aliases: GIC
### Keywords: graph_information_criterion

### ** Examples

require(igraph)
A <- as.matrix(get.adjacency(erdos.renyi.game(100, p=0.5)))
# Using a string to indicate the graph model
result1 <- GIC(A, "ER", 0.5)
result1

# Using a function to describe the graph model
# Erdos-Renyi graph
model <- function(n, p) {
   return(as.matrix(get.adjacency(erdos.renyi.game(n, p))))
}
result2 <- GIC(A, model, 0.5)
result2



