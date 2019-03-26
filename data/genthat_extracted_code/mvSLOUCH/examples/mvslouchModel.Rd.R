library(mvSLOUCH)


### Name: mvslouchModel
### Title: Estimate parameters under a (multivariate) OUBM model of
###   evolution
### Aliases: mvslouchModel
### Keywords: models multivariate htest

### ** Examples

set.seed(12345)
### We will first simulate a small phylogenetic tree using functions from ape. 
### For simulating the tree one could also use alternative functions, eg. sim.bd.taxa 
### from the TreeSim package
phyltree<-ape::rtree(3)

## The line below is not necessary but advisable for speed
phyltree<-phyltree_paths(phyltree)

### Define a vector of regimes.
regimes<-c("small","small","large","small")

OUBMparameters<-list(vY0=matrix(1,ncol=1,nrow=1),A=matrix(0.5,ncol=1,nrow=1),
B=matrix(2,ncol=1,nrow=1),mPsi=cbind("small"=1,"large"=-1),
Syy=matrix(2,ncol=1,nrow=1),vX0=matrix(0,ncol=1,nrow=1),Sxx=diag(2,1,1),
Syx=matrix(0,ncol=1,nrow=1),Sxy=matrix(0,ncol=1,nrow=1))

### Now simulate the data.
OUBMdata<-simulMVSLOUCHProcPhylTree(phyltree,OUBMparameters,regimes,NULL)
OUBMdata<-OUBMdata[phyltree$tip.label,,drop=FALSE]

### Try to recover the parameters of the mvOUBM model.
### maxiter here set to minimal working possibility, in reality it should be larger
### e.g. default of c(10,50,100)
### Also the Atype and Syytype variables should be changed, here set as simplest
### for speed of evaluation, e.g. Atype="DecomposablePositive", Syytype="UpperTri"
OUBMestim<-mvslouchModel(phyltree,OUBMdata,1,regimes,Atype="SingleValueDiagonal",
Syytype="SingleValueDiagonal",diagA="Positive",maxiter=c(1,2,1))

## Not run: 
##D  ##It takes too long to run this
##D ## take a less trivial setup
##D phyltree<-ape::rtree(5)
##D 
##D ## The line below is not necessary but advisable for speed
##D phyltree<-phyltree_paths(phyltree)
##D 
##D ### Define a vector of regimes.
##D regimes<-c("small","small","large","small","small","large","large","large")
##D 
##D ### Define SDE parameters to be able to simulate data under the mvOUBM model.
##D OUBMparameters<-list(vY0=matrix(c(1,-1),ncol=1,nrow=2),A=rbind(c(9,0),c(0,5)),
##D B=matrix(c(2,-2),ncol=1,nrow=2),mPsi=cbind("small"=c(1,-1),"large"=c(-1,1)),
##D Syy=rbind(c(1,0.25),c(0,1)),vX0=matrix(0,1,1),Sxx=matrix(1,1,1),
##D Syx=matrix(0,ncol=1,nrow=2),Sxy=matrix(0,ncol=2,nrow=1))
##D 
##D ### Now simulate the data.
##D OUBMdata<-simulMVSLOUCHProcPhylTree(phyltree,OUBMparameters,regimes,NULL)
##D OUBMdata<-OUBMdata[phyltree$tip.label,,drop=FALSE]
##D 
##D ### Try to recover the parameters of the mvOUBM model.
##D OUBMestim<-mvslouchModel(phyltree,OUBMdata,2,regimes,Atype="DecomposablePositive",
##D Syytype="UpperTri",diagA="Positive",maxiter=c(10,50,100))
##D 
##D ### And finally bootstrap with particular interest in the evolutionary and optimal
##D ### regressions
##D OUBMbootstrap<-parametric.bootstrap(estimated.model=OUBMestim,phyltree=phyltree,
##D values.to.bootstrap=c("evolutionary.regression","optimal.regression"),
##D regimes=regimes,root.regime="small",M.error=NULL,predictors=c(3),kY=2,
##D numboot=5,Atype="DecomposablePositive",Syytype="UpperTri",diagA="Positive")
## End(Not run)



