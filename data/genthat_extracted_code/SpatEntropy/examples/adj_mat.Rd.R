library(SpatEntropy)


### Name: adj_mat
### Title: Adjacency matrix.
### Aliases: adj_mat

### ** Examples

dist.mat=euclid_dist(cbind(rep(1:5, each=5), rep(1:5,5)))
plot(cbind(rep(1:5, each=5), rep(1:5,5)))
adj_mat(dist.mat, dd1=dist.mat[1,2]) #for the contiguity matrix
adj_mat(dist.mat, 1, 3)




