library(progenyClust)


### Name: hclust.progenyClust
### Title: Hierarchical Clustering
### Aliases: hclust.progenyClust
### Keywords: hierarchical cluster plot

### ** Examples

# a 3-cluster 2-dimensional example dataset
data('test')

# default progeny clsutering
progenyClust(test,FUNclust=hclust.progenyClust,ncluster=2:5)->pc

# plot the scores to select the optimal cluster number
plot(pc)

# plot the clustering results with the optimal cluster number
plot(pc,test)



