library(hypervolume)


### Name: estimate_bandwidth
### Title: Kernel bandwidth estimators for hypervolumes
### Aliases: estimate_bandwidth

### ** Examples

data(iris)
print(estimate_bandwidth(iris[,1:2],method="silverman"))
print(estimate_bandwidth(iris[,1:2],method="plug-in"))
print(estimate_bandwidth(iris[,1:2],method="cross-validation"))



