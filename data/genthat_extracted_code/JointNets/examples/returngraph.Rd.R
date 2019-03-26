library(JointNets)


### Name: returngraph
### Title: return igraph object from jointnet result specified by user
###   input
### Aliases: returngraph

### ** Examples

library(JointNets)
data(exampleData)
result = jeek(X = exampleData, 0.3, covType = "cov", parallel = FALSE)
graph = returngraph(result)



