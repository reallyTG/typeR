library(mclust)


### Name: emControl
### Title: Set control values for use with the EM algorithm.
### Aliases: emControl
### Keywords: cluster

### ** Examples

irisBIC <- mclustBIC(iris[,-5], control = emControl(tol = 1.e-6))
summary(irisBIC, iris[,-5])



