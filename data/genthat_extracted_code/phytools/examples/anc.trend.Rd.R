library(phytools)


### Name: anc.trend
### Title: Ancestral character estimation with a trend
### Aliases: anc.trend
### Keywords: phylogenetics comparative method maximum likelihood

### ** Examples

tree<-rtree(20)
x<-fastBM(tree,mu=2) # simulate using fastBM with a trend (m!=0)
anc.trend(tree,x) # fit model & estimate ancestral states



