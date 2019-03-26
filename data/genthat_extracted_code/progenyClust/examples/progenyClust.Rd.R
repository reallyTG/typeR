library(progenyClust)


### Name: progenyClust
### Title: Progeny Clustering
### Aliases: progenyClust summary.progenyClust print.summary.progenyClust
### Keywords: cluster

### ** Examples

# a 3-cluster 2-dimensional example dataset
data('test')

# default progeny clsutering
progenyClust(test,ncluster=2:5)->pc

summary(pc)
plot(pc)




