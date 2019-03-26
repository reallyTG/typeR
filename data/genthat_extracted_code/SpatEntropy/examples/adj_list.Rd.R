library(SpatEntropy)


### Name: adj_list
### Title: Adjacency list for spatial entropy.
### Aliases: adj_list

### ** Examples

dist.breaks=c(0,1,2,5,10*sqrt(2))
dist.mat=euclid_dist(coords_pix(square(10), nrow=10, ncol=10))
my.adj.list=adj_list(dist.mat, dist.breaks)




