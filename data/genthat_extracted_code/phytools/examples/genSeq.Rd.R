library(phytools)


### Name: genSeq
### Title: Simulate a DNA alignment on the tree under a model
### Aliases: genSeq
### Keywords: phylogenetics simulation

### ** Examples

## simulate gamma rate heterogeneity
tree<-pbtree(n=26,tip.label=LETTERS)
gg<-rgamma(n=100,shape=0.25,rate=0.25)
X<-genSeq(tree,l=100,rate=gg)



