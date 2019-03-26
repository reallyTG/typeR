library(useful)


### Name: ComputeHartigan
### Title: Compute Hartigan's Number
### Aliases: ComputeHartigan
### Keywords: cluster clustering hartigan kmeans

### ** Examples

data(iris)
hartiganResults <- FitKMeans(iris[, -ncol(iris)])
PlotHartigan(hartiganResults)




