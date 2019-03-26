library(JointNets)


### Name: simule
### Title: A constrained l1 minimization approach for estimating multiple
###   Sparse Gaussian or Nonparanormal Graphical Models Estimate multiple,
###   related sparse Gaussian or Nonparanormal graphical
### Aliases: simule

### ** Examples

library(JointNets)
data(exampleData)
result = simule(X = exampleData , lambda = 0.1, epsilon = 0.45, covType = "cov", FALSE)
plot(result)



