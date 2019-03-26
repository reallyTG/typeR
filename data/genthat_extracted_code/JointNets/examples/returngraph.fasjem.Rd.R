library(JointNets)


### Name: returngraph.fasjem
### Title: return igraph object from fasjem result specified by user input
### Aliases: returngraph.fasjem

### ** Examples

library(JointNets)
data(exampleData)
result = fasjem(X = exampleData, method = "fasjem-g", 0.5, 0.1, 0.1, 0.05, 10)
graph = returngraph(result)



