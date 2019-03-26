library(SpatEntropy)


### Name: spat_entropy
### Title: Altieri's spatial entropy.
### Aliases: spat_entropy

### ** Examples

data=matrix(sample(1:5, 25, replace=TRUE), nrow=5)
plot(as.im(data, W=square(5)))
dist.breaks=c(0,1,2,5,5*sqrt(2))
dist.mat=euclid_dist(coords_pix(square(5), nrow=5, ncol=5))
my.adj.list=adj_list(dist.mat, dist.breaks) #see adj_list
my.shZ=shannonZ(data)
spat_entropy(data=data, adj.list=my.adj.list, shannZ=my.shZ)




