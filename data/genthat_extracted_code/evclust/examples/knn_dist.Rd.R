library(evclust)


### Name: knn_dist
### Title: K nearest neighbors in a dissimilarity matrix
### Aliases: knn_dist

### ** Examples

data(butterfly)
n <- nrow(butterfly)
D<-as.matrix(dist(butterfly))
knn<-knn_dist(D,K=2)
knn$nn.dist
knn$nn.index



