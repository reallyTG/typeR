library(useful)


### Name: PlotHartigan
### Title: Plot a series of Hartigan's Numbers
### Aliases: PlotHartigan
### Keywords: cluster clustering hartigan kmeans

### ** Examples


data(iris)
hartiganResults <- FitKMeans(iris[, -ncol(iris)])
PlotHartigan(hartiganResults)




