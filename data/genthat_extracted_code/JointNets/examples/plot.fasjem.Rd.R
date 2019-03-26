library(JointNets)


### Name: plot.fasjem
### Title: Plot fasjem result specified by user input
### Aliases: plot.fasjem

### ** Examples

library(JointNets)
data(exampleData)
result = fasjem(X = exampleData, method = "fasjem-g", 0.5, 0.1, 0.1, 0.05, 10)
plot(result)



