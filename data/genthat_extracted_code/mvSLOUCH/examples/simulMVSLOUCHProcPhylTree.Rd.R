library(mvSLOUCH)


### Name: simulMVSLOUCHProcPhylTree
### Title: Simulate data on a phylogeny under a (multivariate) OUBM model
### Aliases: simulMVSLOUCHProcPhylTree
### Keywords: models multivariate datagen

### ** Examples

set.seed(12345)
### We will first simulate a small phylogenetic tree using functions from ape.
### For simulating the tree one could also use alternative functions, eg. sim.bd.taxa 
### from the TreeSim package
phyltree<-ape::rtree(5)

## The line below is not necessary but advisable for speed
phyltree<-phyltree_paths(phyltree)

### Define a vector of regimes.
regimes<-c("small","small","large","small","small","large","large","large")

### Define SDE parameters to be able to simulate data under the mvOUBM model.
OUBMparameters<-list(vY0=matrix(c(1,-1),ncol=1,nrow=2),A=rbind(c(9,0),c(0,5)),
B=matrix(c(2,-2),ncol=1,nrow=2),mPsi=cbind("small"=c(1,-1),"large"=c(-1,1)),
Syy=rbind(c(1,0.25),c(0,1)),vX0=matrix(0,1,1),Sxx=matrix(1,1,1),
Syx=matrix(0,ncol=1,nrow=2),Sxy=matrix(0,ncol=2,nrow=1))

### Now simulate the data.
jumpobj<-list(jumptype="RandomLineage",jumpprob=0.5,jumpdistrib="Normal",
vMean=rep(0,3),mCov=diag(1,3,3))
OUBMdata<-simulMVSLOUCHProcPhylTree(phyltree,OUBMparameters,regimes,NULL,
jumpsetup=jumpobj)



