library(JointNets)


### Name: plot.wsimule
### Title: Plot wsimule result specified by user input
### Aliases: plot.wsimule

### ** Examples

library(JointNets)
data(exampleData)
result = wsimule(X = exampleData , lambda = 0.1, epsilon = 0.45,
W = matrix(1,20,20), covType = "cov", FALSE)
plot(result)



