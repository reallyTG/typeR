library(JointNets)


### Name: jeek
### Title: A Fast and Scalable Joint Estimator for Integrating Additional
###   Knowledge in Learning Multiple Related Sparse Gaussian Graphical
###   Models
### Aliases: jeek

### ** Examples

library(JointNets)
data(exampleData)
result = jeek(X = exampleData, 0.3, covType = "cov", parallel = FALSE)
plot(result)



