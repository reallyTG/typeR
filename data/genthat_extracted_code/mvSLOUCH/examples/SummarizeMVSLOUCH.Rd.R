library(mvSLOUCH)


### Name: SummarizeMVSLOUCH
### Title: Summarize parameters estimated under a multivariate OUBM motion
###   model
### Aliases: SummarizeMVSLOUCH
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

### Define SDE parameters to be able to simulate data under the mvOUBM model.
OUBMparameters<-list(vY0=matrix(1,ncol=1,nrow=1),A=matrix(0.5,ncol=1,nrow=1),
B=matrix(c(2),ncol=1,nrow=1),mPsi=cbind("small"=1,"large"=-1),
Syy=matrix(2,ncol=1,nrow=1),vX0=matrix(0,ncol=1,nrow=1),Sxx=diag(1,1,1),
Syx=matrix(0,ncol=1,nrow=1),Sxy=matrix(0,ncol=1,nrow=1))

### Now simulate the data.
OUBMdata<-simulMVSLOUCHProcPhylTree(phyltree,OUBMparameters,regimes,NULL)
OUBMdata<-OUBMdata[phyltree$tip.label,,drop=FALSE]

## Here we do not do any recovery step
OUBM.summary<-SummarizeMVSLOUCH(phyltree,OUBMdata,OUBMparameters,
regimes,t=c(1),dof=11,maxiter=2)


## Not run: 
##D  ##It takes too long to run this
##D ## now less trivial simulation setup
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
##D OUBMdata<-OUBMdata[phyltree$tip.label,]
##D 
##D ### Try to recover the parameters of the mvOUBM model.
##D OUBMestim<-mvslouchModel(phyltree,OUBMdata,2,regimes,Atype="DecomposablePositive",
##D Syytype="UpperTri",diagA="Positive")
##D 
##D ### Summarize them.
##D OUBM.summary<-SummarizeMVSLOUCH(phyltree,OUBMdata,OUBMestim$FinalFound$ParamsInModel,
##D regimes,t=c(phyltree$tree_height),dof=OUBMestim$FinalFound$ParamSummary$dof,maxiter=50)
##D 
##D ### And finally bootstrap with particular interest in the evolutionary and optimal
##D ### regressions
##D OUBMbootstrap<-parametric.bootstrap(estimated.model=OUBMestim,phyltree=phyltree,
##D values.to.bootstrap=c("evolutionary.regression","optimal.regression"),
##D regimes=regimes,root.regime="small",M.error=NULL,predictors=c(3),kY=2,
##D numboot=5,Atype="DecomposablePositive",Syytype="UpperTri",diagA="Positive")
## End(Not run)



