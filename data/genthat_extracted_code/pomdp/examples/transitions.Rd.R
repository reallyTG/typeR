library(pomdp)


### Name: transitions
### Title: Extract Transition Matrices from a POMDP
### Aliases: transitions

### ** Examples

data("TigerProblem")

trans <- transitions(TigerProblem)
trans

## plot the Markov model for action listening (tiger stays in place) 
library("igraph")

listen <- graph_from_adjacency_matrix(trans$listen, weighted = TRUE)
plot(listen, main = "Action: listen",
  layout = layout_on_grid, vertex.size = 40, edge.arrow.size =.5)



