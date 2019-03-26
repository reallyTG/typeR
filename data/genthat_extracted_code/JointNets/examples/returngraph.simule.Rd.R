library(JointNets)


### Name: returngraph.simule
### Title: return igraph object from simule result specified by user input
### Aliases: returngraph.simule

### ** Examples

library(JointNets)
data(exampleData)
result = simule(X = exampleData , lambda = 0.1, epsilon = 0.45, covType = "cov", FALSE)
graph = returngraph(result)



