library(JointNets)


### Name: returngraph.jeek
### Title: return igraph object from jeek result specified by user input
### Aliases: returngraph.jeek

### ** Examples

library(JointNets)
data(exampleData)
result = jeek(X = exampleData, 0.3, covType = "cov", parallel = FALSE)
graph = returngraph(result)



