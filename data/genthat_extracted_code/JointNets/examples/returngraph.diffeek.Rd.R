library(JointNets)


### Name: returngraph.diffeek
### Title: return igraph object from diffee result specified by user input
### Aliases: returngraph.diffeek

### ** Examples

library(JointNets)
data(exampleData)
result = diffeek(exampleData[[1]], exampleData[[2]],
W = matrix(1,20,20), g = rep(0,20),epsilon = 0.2,
lambda = 0.4,covType = "cov")
graph = returngraph(result)



