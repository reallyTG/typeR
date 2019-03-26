library(statGraph)


### Name: graph.model.selection
### Title: Graph model selection
### Aliases: graph.model.selection
### Keywords: model_selection

### ** Examples


require(igraph)
A <- as.matrix(get.adjacency(erdos.renyi.game(30, p=0.5)))
# Using strings to indicate the graph models
result1 <- graph.model.selection(A, models=c("ER", "WS"), eps=0.5)
result1
# Using functions to describe the graph models
# Erdos-Renyi graph
model1 <- function(n, p) {
   return(as.matrix(get.adjacency(erdos.renyi.game(n, p))))
}
# Watts-Strougatz graph
model2 <- function(n, pr, K=8) {
    return(as.matrix(get.adjacency(watts.strogatz.game(1, n, K, pr))))
}
parameters <- list(seq(0, 1, 0.5), seq(0, 1, 0.5))
result2 <- graph.model.selection(A, list(model1, model2), parameters)
result2



