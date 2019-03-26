library(progenyClust)


### Name: plot.progenyClust
### Title: Plot Progeny Clustering Results
### Aliases: plot.progenyClust
### Keywords: cluster plot

### ** Examples

# a 3-cluster 2-dimensional example dataset
data('test')

# default progeny clsutering
progenyClust(test,ncluster=2:5)->pc

# plot the scores to select the optimal cluster number
plot(pc)

# plot the clustering results with the optimal cluster number
plot(pc,test)



