library(statGraph)


### Name: graph.param.estimator
### Title: Graph parameter estimator
### Aliases: graph.param.estimator
### Keywords: parameter_estimation

### ** Examples

require(igraph)
A <- as.matrix(get.adjacency(erdos.renyi.game(50, p=0.5)))

# Using a string to indicate the graph model
result1 <- graph.param.estimator(A, "ER", eps=0.25)
result1

## Using a function to describe the graph model
## Erdos-Renyi graph
# model <- function(n, p) {
#    return(as.matrix(get.adjacency(erdos.renyi.game(n, p))))
# }
# result2 <- graph.param.estimator(A, model,  seq(0.2, 0.8, 0.1))
# result2



