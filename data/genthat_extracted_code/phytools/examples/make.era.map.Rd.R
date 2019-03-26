library(phytools)


### Name: make.era.map
### Title: Create "era" map on a phylogenetic tree
### Aliases: make.era.map
### Keywords: phylogenetics comparative method

### ** Examples

tree<-pbtree(n=1000,scale=100)
tree<-make.era.map(tree,c(0,25,50,75))
plotSimmap(tree,pts=FALSE,ftype="off")



