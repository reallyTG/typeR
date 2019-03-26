library(mvSLOUCH)


### Name: drawPhylProcess
### Title: Plots the realization of a process evolving on a phylogenetic
###   tree
### Aliases: drawPhylProcess
### Keywords: hplot

### ** Examples

set.seed(12345)
### We will first simulate a small phylogenetic tree using functions from ape.
### For simulating the tree one could also use alternative functions, eg. sim.bd.taxa 
### from the TreeSim package
phyltree<-ape::rtree(4)

## The line below is not necessary but advisable for speed
phyltree<-phyltree_paths(phyltree)

### Define a vector of regimes.
#regimes<-c("small","small","large","small","small","large","large","large")
regimes<-c("small","small","large","small","small","large")

### Define SDE parameters to be able to simulate data under the OUOU model.
OUOUparameters<-list(vY0=matrix(c(1,-1,0.5),nrow=3,ncol=1),
A=rbind(c(9,0,0),c(0,5,0),c(0,0,1)),mPsi=cbind("small"=c(1,-1,0.5),
"large"=c(-1,1,0.5)),Syy=rbind(c(1,0.25,0.3),c(0,1,0.2),c(0,0,1)))

### Now simulate the data keeping the whole trajectory
OUOUdata<-simulOUCHProcPhylTree(phyltree,OUOUparameters,regimes,NULL,fullTrajectory=TRUE)
drawPhylProcess(PhylTraitProcess=OUOUdata,plotlayout=c(1,3))




