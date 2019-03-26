library(marl)


### Name: marl-package
### Title: Multivariate Analysis Based on Relative Likelihoods.
### Aliases: marl-package marl
### Keywords: multivariate relative.likelihood

### ** Examples

x <- sim.negbin(c(4,5,10),3,10,12)
negbin.rel.clust(x,1,20,nclust = 3,len=200,plot=TRUE,seed=132)
negbin.rel.pca(x,1,20,len=20,plot=TRUE,seed=132)



