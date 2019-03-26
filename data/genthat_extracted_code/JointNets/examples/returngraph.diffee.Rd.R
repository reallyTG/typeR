library(JointNets)


### Name: returngraph.diffee
### Title: return igraph object from diffee result specified by user input
### Aliases: returngraph.diffee

### ** Examples

library(JointNets)
data(exampleData)
result = diffee(exampleData[[1]], exampleData[[2]], 0.45)
graph = returngraph(result)



