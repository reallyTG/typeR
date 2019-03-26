library(backShift)


### Name: exampleAdjacencyMatrix
### Title: Example adjacency matrix
### Aliases: exampleAdjacencyMatrix
### Keywords: datasets

### ** Examples

data("exampleAdjacencyMatrix")
plotGraphEdgeAttr(estimate = exampleAdjacencyMatrix, plotStabSelec = FALSE, 
                  labels = colnames(exampleAdjacencyMatrix),
                  thres.point = 0, thres.stab = NULL, main = "True graph")



