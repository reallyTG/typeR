library(JointNets)


### Name: returngraph.wsimule
### Title: return igraph object from wsimule result specified by user input
### Aliases: returngraph.wsimule

### ** Examples

library(JointNets)
data(exampleData)
result = wsimule(X = exampleData , lambda = 0.1, epsilon = 0.45,
W = matrix(1,20,20), covType = "cov", FALSE)
graph = returngraph(result)



