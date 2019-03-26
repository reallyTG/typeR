library(SpatEntropy)


### Name: pair_count
### Title: Build pairs (unordered couples) in a dataset.
### Aliases: pair_count

### ** Examples

dist.mat=euclid_dist(cbind(rep(1:5, each=5), rep(1:5,5)))
adj.mat=adj_mat(dist.mat, dd1=dist.mat[1,2]) #for the contiguity matrix
pair_count(sample(1:3, 25, replace=TRUE), adj.mat)




