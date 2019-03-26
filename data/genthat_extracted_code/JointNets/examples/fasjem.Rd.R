library(JointNets)


### Name: fasjem
### Title: A Fast and Scalable Joint Estimator for Learning Multiple
###   Related Sparse Gaussian Graphical Models
### Aliases: fasjem
### Keywords: fasjem

### ** Examples

library(JointNets)
data(exampleData)
result = fasjem(X = exampleData, method = "fasjem-g", 0.5, 0.1, 0.1, 0.05, 10)
plot(result)



