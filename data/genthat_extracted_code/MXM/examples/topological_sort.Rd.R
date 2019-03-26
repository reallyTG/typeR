library(MXM)


### Name: Topological sort of a DAG
### Title: Topological sort of a DAG
### Aliases: topological_sort
### Keywords: Topological sort DAG

### ** Examples

# simulate a dataset with continuous data
# simulate a dataset with continuous data
G = rdag(1000, 10, 0.3)$G
G[G == 2] <- 1
G[G == 3] <- 0
topological_sort(G)



