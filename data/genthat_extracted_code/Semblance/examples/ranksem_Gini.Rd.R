library(Semblance)


### Name: ranksem_Gini
### Title: Compute Gini-weighted Semblance
### Aliases: ranksem_Gini

### ** Examples

# Simulation Example when the user inputs a matrix with single-cell gene expression data
ngenes = 10
ncells = 10
nclust = 2
mu=c(5, 1) #mean in cluster 1, cluster 2 for informative genes
sigma=c(2, 1) #stdev in cluster 1, cluster 2 for informative genes
size.rare.clust = 0.2
prop.info.genes = 0.2
n.info.genes=round(prop.info.genes*ngenes)
n.clust1.cells = round(ncells*size.rare.clust)
mu1=c(rep(mu[1]*sigma[2], n.info.genes), rep(0, ngenes-n.info.genes))
mu2=c(rep(mu[2]*sigma[2], n.info.genes), rep(0, ngenes-n.info.genes))
sig1=c(rep(sigma[1], n.info.genes), rep(1, ngenes-n.info.genes))
sig2=c(rep(sigma[2], n.info.genes), rep(1, ngenes-n.info.genes))
X=matrix(ncol=ngenes, nrow=ncells, data=0)
for(i in 1:n.clust1.cells){
  X[i,] = rnorm(ngenes, mean=mu1, sd=sig1)
}
for(i in (n.clust1.cells+1):ncells){
  X[i,] = rnorm(ngenes, mean=mu2, sd=sig2)
}
Noise <- matrix(rnorm(prod(dim(X)), mean=2, sd=0.4), nrow = 10)
X = X + Noise
#Compute kernels/distances
rks=ranksem_Gini(X)



