library(optrees)


### Name: maxFlowFordFulkerson
### Title: Maximum flow with the Ford-Fulkerson algorithm
### Aliases: maxFlowFordFulkerson

### ** Examples

# Graph
nodes <- 1:6
arcs <- matrix(c(1,2,1, 1,3,7, 2,3,1, 2,4,3, 2,5,2, 3,5,4, 4,5,1, 4,6,6,
                5,6,2), byrow = TRUE, ncol = 3)
# Maximum flow with Ford-Fulkerson algorithm
maxFlowFordFulkerson(nodes, arcs, source.node = 2, sink.node = 6)



