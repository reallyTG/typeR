library(Semblance)


### Name: ranksem
### Title: Compute Semblance For a Given Input Matrix or Data Frame
### Aliases: ranksem

### ** Examples

# Simulation Example when the user inputs a matrix with single-cell gene expression data
ngenes = 10
ncells = 10
nclust = 2
mu=c(100, 0) #mean in cluster 1, cluster 2 for informative genes
sigma=c(0.01, 1) #stdev in cluster 1, cluster 2 for informative genes
size.rare.clust = 0.1
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
#Compute kernels/distances
rks=ranksem(X)



