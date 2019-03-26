library(useful)


### Name: FitKMeans
### Title: Fit a series of kmeans clusterings and compute Hartigan's Number
### Aliases: FitKMeans
### Keywords: cluster clustering hartigan kmeans

### ** Examples


data(iris)
hartiganResults <- FitKMeans(iris[, -ncol(iris)])
PlotHartigan(hartiganResults)




