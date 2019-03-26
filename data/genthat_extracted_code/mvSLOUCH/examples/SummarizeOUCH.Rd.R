library(mvSLOUCH)


### Name: SummarizeOUCH
### Title: Summarize parameters estimated under a (multivariate) OU motion
###   model
### Aliases: SummarizeOUCH
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

### Define the SDE parameters to be able to simulate data under the OUOU model.
OUOUparameters<-list(vY0=matrix(c(1,-1,0.5),nrow=3,ncol=1),
A=rbind(c(9,0,0),c(0,5,0),c(0,0,1)),mPsi=cbind("small"=c(1,-1,0.5),
"large"=c(-1,1,0.5)),Syy=rbind(c(1,0.25,0.3),c(0,1,0.2),c(0,0,1)))

### Now simulate the data.
OUOUdata<-simulOUCHProcPhylTree(phyltree,OUOUparameters,regimes,NULL)
OUOUdata<-OUOUdata[phyltree$tip.label,,drop=FALSE]

## Here we do not do any recovery step
OUOU.summary<-SummarizeOUCH(phyltree,OUOUdata,OUOUparameters,
regimes,t=c(1),dof=8)


## Not run: 
##D  ##It takes too long to run this
##D ## Now we take a less trivial simulation setup
##D ### Recover the parameters of the OUOU model.
##D OUOUestim<-ouchModel(phyltree,OUOUdata,regimes,Atype="DecomposablePositive",
##D Syytype="UpperTri",diagA="Positive",maxiter=c(10,100))
##D 
##D ### Summarize them.
##D OUOU.summary<-SummarizeOUCH(phyltree,OUOUdata,OUOUestim$FinalFound$ParamsInModel,
##D regimes,t=c(1),dof=OUOUestim$FinalFound$ParamSummary$dof)
##D 
##D 
##D ### And finally bootstrap with particular interest in the evolutionary regression
##D OUOUbootstrap<-parametric.bootstrap(estimated.model=OUOUestim,phyltree=phyltree,
##D values.to.bootstrap=c("evolutionary.regression"),regimes=regimes,root.regime="small",
##D M.error=NULL,predictors=c(3),kY=NULL,numboot=5,Atype=NULL,Syytype=NULL,diagA=NULL)
## End(Not run)



