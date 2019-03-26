library(apcluster)


### Name: sort-methods
### Title: Sort clusters
### Aliases: sort sort-methods sort,APResult-method sort,ExClust-method
### Keywords: cluster methods

### ** Examples

## create two Gaussian clouds
cl1 <- cbind(rnorm(50,0.2,0.05),rnorm(50,0.8,0.06))
cl2 <- cbind(rnorm(50,0.7,0.08),rnorm(50,0.3,0.05))
x <- rbind(cl1,cl2)

## run affinity propagation
apres <- apcluster(negDistMat(r=2), x, q=0.7)

show(apres)
## show dendrogram
plot(aggExCluster(x=apres))

## default sort order: like in heatmap or dendrogram
show(sort(apres))

## show dendrogram (note the different cluster numbers!)
plot(aggExCluster(x=sort(apres)))

## sort by size
show(sort(apres, decreasing=TRUE, sortBy="size"))



