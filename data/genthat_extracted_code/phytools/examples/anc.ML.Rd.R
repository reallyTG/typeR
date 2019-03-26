library(phytools)


### Name: anc.ML
### Title: Ancestral character estimation using likelihood
### Aliases: anc.ML
### Keywords: phylogenetics comparative method maximum likelihood

### ** Examples

tree<-pbtree(n=50)
x<-fastBM(tree) # simulate using fastBM
anc.ML(tree,x) # fit model & estimate ancestral states



