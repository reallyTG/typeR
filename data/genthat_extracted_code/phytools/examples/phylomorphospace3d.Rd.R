library(phytools)


### Name: phylomorphospace3d
### Title: Creates tree-dimensional phylomorphospace plot
### Aliases: phylomorphospace3d
### Keywords: phylogenetics comparative method plotting

### ** Examples

tree<-pbtree(n=26,tip.label=LETTERS)
X<-fastBM(tree,nsim=3)
## Not run: 
##D phylomorphospace3d(tree,X,control=list(spin=FALSE))
## End(Not run)
phylomorphospace3d(tree,X,method="static")



