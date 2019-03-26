library(mvSLOUCH)


### Name: parametric.bootstrap
### Title: Parametric bootstrap for confidence intervals
### Aliases: parametric.bootstrap
### Keywords: models multivariate htest

### ** Examples

set.seed(12345)
### We will first simulate a small phylogenetic tree using functions from ape. 
### For simulating the tree one could also use alternative functions, eg. sim.bd.taxa 
### from the TreeSim package
phyltree<-ape::rtree(5)

## The line below is not necessary but advisable for speed
phyltree<-phyltree_paths(phyltree)

BMparameters<-list(vX0=matrix(0,nrow=3,ncol=1),
Sxx=rbind(c(1,0,0),c(0.2,1,0),c(0.3,0.25,1)))

### Now simulate the data.
BMdata<-simulBMProcPhylTree(phyltree,X0=BMparameters$vX0,Sigma=BMparameters$Sxx)
BMdata<-BMdata[phyltree$tip.label,,drop=FALSE]

### Recover the parameters of the Brownian motion.
BMestim<-BrownianMotionModel(phyltree,BMdata)

### And finally obtain bootstrap condfidence intervals for some parameters
BMbootstrap<-parametric.bootstrap(estimated.model=BMestim,phyltree=phyltree,
values.to.bootstrap=c("vX0","StS"),M.error=NULL,numboot=2)

## Not run: 
##D ##It takes too long to run this
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
##D 
##D OUBMbootstrap<-parametric.bootstrap(estimated.model=OUBMestim,phyltree=phyltree,
##D values.to.bootstrap=c("evolutionary.regression","optimal.regression"),
##D regimes=regimes,root.regime="small",M.error=NULL,predictors=c(3),kY=2,
##D numboot=5,Atype="DecomposablePositive",Syytype="UpperTri",diagA="Positive",
##D maxiter=c(10,50,100))
##D 
##D 
##D ### We now demonstrate an alternative setup
##D ### Define SDE parameters to be able to simulate data under the OUOU model.
##D OUOUparameters<-list(vY0=matrix(c(1,-1,0.5),nrow=3,ncol=1),
##D A=rbind(c(9,0,0),c(0,5,0),c(0,0,1)),mPsi=cbind("small"=c(1,-1,0.5),"large"=c(-1,1,0.5)),
##D Syy=rbind(c(1,0.25,0.3),c(0,1,0.2),c(0,0,1)))
##D 
##D ### Now simulate the data.
##D OUOUdata<-simulOUCHProcPhylTree(phyltree,OUOUparameters,regimes,NULL)
##D OUOUdata<-OUOUdata[phyltree$tip.label,,drop=FALSE]
##D 
##D ### Try to recover the parameters of the OUOU model.
##D estimResults<-estimate.evolutionary.model(phyltree,OUOUdata,regimes=regimes,
##D root.regime="small",M.error=NULL,repeats=3,model.setups=NULL,predictors=c(3),kY=2,
##D doPrint=TRUE,pESS=NULL,maxiter=c(10,50,100))
##D 
##D ### And finally bootstrap with particular interest in the evolutionary regression
##D OUOUbootstrap<-parametric.bootstrap(estimated.model=estimResults,phyltree=phyltree,
##D values.to.bootstrap=c("evolutionary.regression"),
##D regimes=regimes,root.regime="small",M.error=NULL,predictors=c(3),kY=NULL,
##D numboot=5,Atype=NULL,Syytype=NULL,diagA=NULL)
## End(Not run)



