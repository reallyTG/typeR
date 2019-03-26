library(phytools)


### Name: fastAnc
### Title: (Reasonably) fast estimation of ML ancestral states
### Aliases: fastAnc
### Keywords: phylogenetics comparative method maximum likelihood

### ** Examples

tree<-pbtree(n=50)
x<-fastBM(tree) # simulate using fastBM
fastAnc(tree,x) # estimate states



