library(NetworkDistance)


### Name: nd.centrality
### Title: Centrality Distance
### Aliases: nd.centrality

### ** Examples

## generate two types of adjacency matrices of size (3-by-3)
rbin1 = rbinom(9,1,0.8); mat1 = matrix(rbin1,nrow=3)
rbin2 = rbinom(9,1,0.2); mat2 = matrix(rbin2,nrow=3)

mattype1 = ceiling((mat1+t(mat1))/2); diag(mattype1)=0;
mattype2 = ceiling((mat2+t(mat2))/2); diag(mattype2)=0;

A = list()
for (i in 1:3){A[[i]]=mattype1} # first 3 are type-1
for (i in 4:6){A[[i]]=mattype2} # next  3 are type-2

## use 3 types of centrality measures
out1 <- nd.centrality(A,out.dist=FALSE,mode="Degree")
out2 <- nd.centrality(A,out.dist=FALSE,mode="Close")
out3 <- nd.centrality(A,out.dist=FALSE,mode="Between")

## visualize
par(mfrow=c(1,3))
image(out1$D, main="Degree")
image(out2$D, main="Closeness")
image(out3$D, main="Betweenness")




