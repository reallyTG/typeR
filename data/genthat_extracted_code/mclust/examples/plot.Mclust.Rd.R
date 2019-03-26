library(mclust)


### Name: plot.Mclust
### Title: Plot Model-Based Clustering Results
### Aliases: plot.Mclust
### Keywords: cluster

### ** Examples

precipMclust <- Mclust(precip)
plot(precipMclust)

faithfulMclust <- Mclust(faithful)
plot(faithfulMclust)

irisMclust <- Mclust(iris[,-5])
plot(irisMclust)



