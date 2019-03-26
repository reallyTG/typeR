library(phytools)


### Name: phylomorphospace
### Title: Creates phylomorphospace plot
### Aliases: phylomorphospace project.phylomorphospace
### Keywords: phylogenetics comparative method plotting

### ** Examples

tree<-pbtree(n=25)
X<-fastBM(tree,nsim=2)
phylomorphospace(tree,X,xlab="trait 1",ylab="trait 2")



