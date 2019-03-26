library(SpatEntropy)


### Name: leibovici
### Title: O'Neill's and Leibovici's entropy.
### Aliases: leibovici `oneill`

### ** Examples

##O'NEILL
dist.mat=euclid_dist(cbind(rep(1:5, each=5), rep(1:5,5)))
adj.mat=adj_mat(dist.mat, dd1=dist.mat[1,2]) #for the contiguity matrix
data=sample(1:3, 25, replace=TRUE)
oneill=leibovici(data, adj.mat)

##LEIBOVICI
dist.mat=euclid_dist(cbind(rep(1:5, each=5), rep(1:5,5)))
adj.mat=adj_mat(dist.mat, dd1=4) #for the contiguity matrix
data=sample(1:3, 25, replace=TRUE)
leib=leibovici(data, adj.mat)




