library(NetworkDistance)


### Name: nd.wsd
### Title: Distance with Weighted Spectral Distribution
### Aliases: nd.wsd

### ** Examples

## generate two types of adjacency matrices of size (3-by-3)
rbin1 = rbinom(9,1,0.8); mat1 = matrix(rbin1,nrow=3)
rbin2 = rbinom(9,1,0.2); mat2 = matrix(rbin2,nrow=3)

mattype1 = ceiling((mat1+t(mat1))/2)
mattype2 = ceiling((mat2+t(mat2))/2)

A = list()
for (i in 1:3){A[[i]]=mattype1} # first 3 are type-1
for (i in 4:6){A[[i]]=mattype2} # next  3 are type-2

## Compute Distance Matrix and Visualize
output = nd.wsd(A, out.dist=FALSE, K=10)
image(output$D, main="two group case")




