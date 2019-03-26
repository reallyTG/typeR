library(phytools)


### Name: fancyTree
### Title: Plots special types of phylogenetic trees
### Aliases: fancyTree
### Keywords: phylogenetics plotting utilities

### ** Examples

# plot tree with extinction
set.seed(10)
tree<-pbtree(b=1,d=0.4,t=4)
fancyTree(tree,type="extinction")

## Not run: 
##D # plot 3D traitgram
##D tree<-pbtree(n=50,scale=10)
##D Y<-sim.corrs(tree,vcv=matrix(c(1,0.75,0.75,1),2,2))
##D fancyTree(tree,type="traitgram3d",X=Y,control=list(spin=FALSE))
##D 	
##D # plot with internal nodes from simulation
##D Y<-sim.corrs(tree,vcv=matrix(c(1,0.75,0.75,1),2,2),internal=TRUE)
##D B<-Y[length(tree$tip)+1:tree$Nnode,]; Y<-Y[1:length(tree$tip),]
##D fancyTree(tree,type="traitgram3d",X=Y,A=B,control=list(simple.axes=TRUE,spin=FALSE))
## End(Not run)
	
# plot with dropped tips
tree<-pbtree(n=30)
tips<-sample(tree$tip.label)[1:10]
pruned<-fancyTree(tree,type="droptip",tip=tips)

## Not run: 
##D # plot 95-percent CI phenogram
##D tree<-pbtree(n=30)
##D x<-fastBM(tree)
##D fancyTree(tree,type="phenogram95",x=x)
## End(Not run)



