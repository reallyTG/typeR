library(SpatEntropy)


### Name: contagion
### Title: Li and Reynolds' relative contagion index.
### Aliases: contagion

### ** Examples


dist.mat=euclid_dist(cbind(rep(1:5, each=5), rep(1:5,5)))
adj.mat=adj_mat(dist.mat, dd1=dist.mat[1,2]) #for the contiguity matrix
data=sample(1:3, 25, replace=TRUE)
oneill=leibovici(data, adj.mat)

contag=contagion(oneill)

contag=contagion(data=data, adj.mat=adj.mat)




