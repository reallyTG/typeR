library(mvSLOUCH)


### Name: mvSLOUCH-package
### Title: Multivariate Ornstein-Uhlenbeck type stochastic differential
###   equation models for phylogenetic comparative data.
### Aliases: mvSLOUCH-package mvSLOUCH
### Keywords: models htest multivariate manip hplot datagen

### ** Examples

set.seed(12345)
### We will first simulate a small phylogenetic tree using functions from ape.
### For simulating the tree one could also use alternative functions, 
## eg. sim.bd.taxa from the TreeSim package
phyltree<-ape::rtree(5)

## The line below is not necessary but advisable for speed
phyltree<-phyltree_paths(phyltree)

### Define a vector of regimes.
regimes<-c("small","small","large","small","small","large","large","large")

### Define SDE parameters to be able to simulate data under the different models.
BMparameters<-list(vX0=matrix(0,nrow=3,ncol=1),
Sxx=rbind(c(1,0,0),c(0.2,1,0),c(0.3,0.25,1)))
OUOUparameters<-list(vY0=matrix(c(1,-1,0.5),nrow=3,ncol=1),
A=rbind(c(9,0,0),c(0,5,0),c(0,0,1)),mPsi=cbind("small"=c(1,-1,0.5),
"large"=c(-1,1,0.5)),Syy=rbind(c(1,0.25,0.3),c(0,1,0.2),c(0,0,1)))
OUBMparameters<-list(vY0=matrix(c(1,-1),ncol=1,nrow=2),A=rbind(c(9,0),c(0,5)),
B=matrix(c(2,-2),ncol=1,nrow=2),mPsi=cbind("small"=c(1,-1),"large"=c(-1,1)),
Syy=rbind(c(1,0.25),c(0,1)),vX0=matrix(0,1,1),Sxx=matrix(1,1,1),
Syx=matrix(0,ncol=1,nrow=2),Sxy=matrix(0,ncol=2,nrow=1))

### Now simulate the data.
BMdata<-simulBMProcPhylTree(phyltree,X0=BMparameters$vX0,Sigma=BMparameters$Sxx)
BMdata<-BMdata[phyltree$tip.label,,drop=FALSE]
OUOUdata<-simulOUCHProcPhylTree(phyltree,OUOUparameters,regimes,NULL)
OUOUdata<-OUOUdata[phyltree$tip.label,,drop=FALSE]
OUBMdata<-simulMVSLOUCHProcPhylTree(phyltree,OUBMparameters,regimes,NULL)
OUBMdata<-OUBMdata[phyltree$tip.label,,drop=FALSE]

### Recover the parameters of the SDEs.
BMestim<-BrownianMotionModel(phyltree,BMdata)
## Not run: 
##D  ##It takes too long to run this from this point
##D OUOUestim<-ouchModel(phyltree,OUOUdata,regimes,Atype="DecomposablePositive",
##D Syytype="UpperTri",diagA="Positive")
##D OUBMestim<-mvslouchModel(phyltree,OUBMdata,2,regimes,Atype="DecomposablePositive",
##D Syytype="UpperTri",diagA="Positive")
##D 
##D ### Usage of the wrapper function
##D 
##D estimResultsBM<-estimate.evolutionary.model(phyltree,BMdata,regimes=NULL,
##D root.regime=NULL,M.error=NULL,repeats=3,model.setups=NULL,predictors=c(3),
##D kY=2,doPrint=TRUE)
##D estimResultsOUOU<-estimate.evolutionary.model(phyltree,OUOUdata,regimes=regimes,
##D root.regime="small",M.error=NULL,repeats=3,model.setups=NULL,predictors=c(3),
##D kY=2,doPrint=TRUE)
##D estimResultsOUBM<-estimate.evolutionary.model(phyltree,OUBMdata,regimes=regimes,
##D root.regime="small",M.error=NULL,repeats=3,model.setups=NULL,predictors=c(3),
##D kY=2,doPrint=TRUE)
##D ## In the wrapper function the resulting best found model parameters are in
##D ## estimResultsBM$BestModel$ParamsInModel
##D ## estimResultsOUOU$BestModel$ParamsInModel
##D ## estimResultsOUBM$BestModel$ParamsInModel
##D 
##D ### Summarize them.
##D BM.summary<-SummarizeBM(phyltree,BMdata,BMestim$ParamsInModel,t=c(1),
##D dof=BMestim$ParamSummary$dof)
##D OUOU.summary<-SummarizeOUCH(phyltree,OUOUdata,OUOUestim$FinalFound$ParamsInModel,
##D regimes,t=c(1),dof=OUOUestim$FinalFound$ParamSummary$dof)
##D OUBM.summary<-SummarizeMVSLOUCH(phyltree,OUBMdata,OUBMestim$FinalFound$ParamsInModel,
##D regimes,t=c(1),dof=OUBMestim$FinalFound$ParamSummary$dof)
##D 
##D 
##D ### Now run the parametric bootstrap to obtain confidence intervals for some parameters.
##D BMbootstrap<-parametric.bootstrap(estimated.model=BMestim,phyltree=phyltree,
##D values.to.bootstrap=c("vX0","StS"),M.error=NULL,numboot=5)
##D OUOUbootstrap<-parametric.bootstrap(estimated.model=estimResultsOUOU,phyltree=phyltree,
##D values.to.bootstrap=c("evolutionary.regression"),regimes=regimes,root.regime="small",
##D M.error=NULL,predictors=c(3),kY=NULL,numboot=5,Atype=NULL,Syytype=NULL,diagA=NULL)
##D OUBMbootstrap<-parametric.bootstrap(estimated.model=OUBMestim,phyltree=phyltree,
##D values.to.bootstrap=c("evolutionary.regression","optimal.regression"),
##D regimes=regimes,root.regime="small",M.error=NULL,predictors=c(3),kY=2,
##D numboot=5,Atype="DecomposablePositive",Syytype="UpperTri",diagA="Positive")
## End(Not run)



