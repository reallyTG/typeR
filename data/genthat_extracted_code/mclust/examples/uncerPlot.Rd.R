library(mclust)


### Name: uncerPlot
### Title: Uncertainty Plot for Model-Based Clustering
### Aliases: uncerPlot
### Keywords: cluster

### ** Examples

irisModel3 <-  Mclust(iris[,-5], G = 3)

uncerPlot(z = irisModel3$z)
 
uncerPlot(z = irisModel3$z, truth = iris[,5])



