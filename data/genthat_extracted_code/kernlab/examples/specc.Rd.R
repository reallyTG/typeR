library(kernlab)


### Name: specc
### Title: Spectral Clustering
### Aliases: specc specc,matrix-method specc,formula-method
###   specc,list-method specc,kernelMatrix-method show,specc-method
### Keywords: cluster

### ** Examples

## Cluster the spirals data set.
data(spirals)

sc <- specc(spirals, centers=2)

sc
centers(sc)
size(sc)
withinss(sc)

plot(spirals, col=sc)




