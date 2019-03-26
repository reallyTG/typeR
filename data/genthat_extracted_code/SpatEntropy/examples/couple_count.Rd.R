library(SpatEntropy)


### Name: couple_count
### Title: Build ordered couples in a dataset.
### Aliases: couple_count

### ** Examples

dist.mat=euclid_dist(cbind(rep(1:5, each=5), rep(1:5,5)))
adj.mat=adj_mat(dist.mat, dd1=dist.mat[1,2]) #for the contiguity matrix
couple_count(sample(1:3, 25, replace=TRUE), adj.mat)




