library(mvSLOUCH)


### Name: ouchModel
### Title: Estimate parameters under a (multivariate) OU model of evolution
### Aliases: ouchModel
### Keywords: models multivariate htest

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

### Define SDE parameters to be able to simulate data under the OUOU model.
OUOUparameters<-list(vY0=matrix(c(1,-1,0.5),nrow=3,ncol=1),
A=rbind(c(9,0,0),c(0,5,0),c(0,0,1)),mPsi=cbind("small"=c(1,-1,0.5),"large"=c(-1,1,0.5)),
Syy=rbind(c(1,0.25,0.3),c(0,1,0.2),c(0,0,1)))

### Now simulate the data.
OUOUdata<-simulOUCHProcPhylTree(phyltree,OUOUparameters,regimes,NULL)
OUOUdata<-OUOUdata[phyltree$tip.label,,drop=FALSE]

### Try to recover the parameters of the OUOU model.
### maxiter here set to minimal working possibility, in reality it should be larger
### e.g. default of c(10,100)
### Also the Atype and Syytype variables should be changed, here set as simplest
### for speed of evaluation, e.g. Atype="DecomposablePositive", Syytype="UpperTri"
OUOUestim<-ouchModel(phyltree,OUOUdata,regimes,Atype="SingleValueDiagonal",
Syytype="SingleValueDiagonal",diagA="Positive",maxiter=c(1,1))

## Not run: 
##D  ##It takes too long to run this
##D ### And finally bootstrap with particular interest in the evolutionary regression
##D OUOUbootstrap<-parametric.bootstrap(estimated.model=OUOUestim,phyltree=phyltree,
##D values.to.bootstrap=c("evolutionary.regression"),regimes=regimes,root.regime="small",
##D M.error=NULL,predictors=c(3),kY=NULL,numboot=5,Atype=NULL,Syytype=NULL,diagA=NULL)
## End(Not run)



