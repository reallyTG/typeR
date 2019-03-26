library(GDAtools)


### Name: medoids
### Title: Computes the medoids of clusters
### Aliases: medoids
### Keywords: multivariate misc

### ** Examples

## Performs of classification of the 'Music' example data set, 
## a clustering in 3 groups
## and then computes the medoids.
data(Music)
temp <- dichotom(Music[,1:5])
d <- dist(temp)
clus <- cutree(hclust(d),3)
medoids(d,clus)



