library(JointNets)


### Name: wsimule
### Title: A constrained and weighted l1 minimization approach for
###   estimating multiple Sparse Gaussian or Nonparanormal Graphical Models
### Aliases: wsimule

### ** Examples

library(JointNets)
data(exampleData)
result = wsimule(X = exampleData , lambda = 0.1, epsilon = 0.45,
W = matrix(1,20,20), covType = "cov", FALSE)
plot(result)



