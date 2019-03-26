library(pomdp)


### Name: policy_graph
### Title: Extract the Policy Graph (as an igraph Object)
### Aliases: policy_graph
### Keywords: graphs

### ** Examples

data("TigerProblem")
tiger_solved <- solve_POMDP(model = TigerProblem)
tiger_solved

policy_graph(tiger_solved)



