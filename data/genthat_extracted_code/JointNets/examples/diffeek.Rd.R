library(JointNets)


### Name: diffeek
### Title: Fast and Scalable Estimator for Using Additional Knowledge in
###   Learning Sparse Structure Change of High Dimensional of Sparse
###   Changes in High-Dimensional Gaussian Graphical Models
### Aliases: diffeek

### ** Examples

library(JointNets)
data(exampleData)
result = diffeek(exampleData[[1]], exampleData[[2]],
W = matrix(1,20,20), g = rep(0,20),epsilon = 0.2,
lambda = 0.4,covType = "cov")
plot(result)



