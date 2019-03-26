library(mvSLOUCH)


### Name: simulBMProcPhylTree
### Title: Simulate data on a phylogeny under a (multivariate) Brownian
###   motion model
### Aliases: simulBMProcPhylTree
### Keywords: models multivariate datagen

### ** Examples

set.seed(12345)
### We will first simulate a small phylogenetic tree using functions from ape.
### For simulating the tree one could also use alternative functions, eg. sim.bd.taxa 
### from the TreeSim package
phyltree<-ape::rtree(5)

## The line below is not necessary but advisable for speed
phyltree<-phyltree_paths(phyltree)

### Define Brownian motion parameters to be able to simulate data 
### under the Brownian motion model.
BMparameters<-list(vX0=matrix(0,nrow=3,ncol=1),
Sxx=rbind(c(1,0,0),c(0.2,1,0),c(0.3,0.25,1)))

### Now simulate the data.
jumpobj<-list(jumptype="RandomLineage",jumpprob=0.5,jumpdistrib="Normal",
vMean=rep(0,3),mCov=diag(1,3,3))
BMdata<-simulBMProcPhylTree(phyltree,X0=BMparameters$vX0,Sigma=BMparameters$Sxx,
jumpsetup=jumpobj)
	



