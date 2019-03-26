library(phytools)


### Name: phylosig
### Title: Compute phylogenetic signal with two methods
### Aliases: phylosig
### Keywords: phylogenetics comparative method maximum likelihood
###   simulation

### ** Examples

tree<-pbtree(n=100)
x<-fastBM(tree)
phylosig(tree,x,method="lambda",test=TRUE)



