library(phytools)


### Name: anc.Bayes
### Title: Bayesian ancestral character estimation
### Aliases: anc.Bayes
### Keywords: phylogenetics comparative method bayesian

### ** Examples

tree<-pbtree(n=50)
x<-fastBM(tree,sig2=2) # simulate using fastBM
obj<-anc.Bayes(tree,x,ngen=10000) # sample ancestral states
print(obj,printlen=20) ## estimates



