library(mvSLOUCH)


### Name: estimate.evolutionary.model
### Title: Wrapper function to find best (out of BM, OU, OUOU, OUBM)
###   fitting evolutionary model and estimate its parameters.
### Aliases: estimate.evolutionary.model
### Keywords: models multivariate htest

### ** Examples

set.seed(12345)
### We will first simulate a small phylogenetic tree using functions from ape.
### For simulating the tree one could also use alternative functions, eg. sim.bd.taxa 
### from the TreeSim package
phyltree<-ape::rtree(4)

## The line below is not necessary but advisable for speed
phyltree<-phyltree_paths(phyltree)

### Define a vector of regimes.
regimes<-c("small","small","large","small","large","small")

### Define SDE parameters to be able to simulate data under the OUOU model.
OUOUparameters<-list(vY0=matrix(c(1,-1,0.5),nrow=3,ncol=1),
A=rbind(c(9,0,0),c(0,5,0),c(0,0,1)),mPsi=cbind("small"=c(1,-1,0.5),"large"=c(-1,1,0.5)),
Syy=rbind(c(1,0.25,0.3),c(0,1,0.2),c(0,0,1)))

### Now simulate the data.
OUOUdata<-simulOUCHProcPhylTree(phyltree,OUOUparameters,regimes,NULL)
OUOUdata<-OUOUdata[phyltree$tip.label,,drop=FALSE]

## set up for a trivial, single model setup case (for running time)
## in a real analysis you should carefully choose between what models
## you want to do model selection
model_setups<-list(list(evolmodel="bm"))

### Try to recover the parameters of the OUOU model.
### maxiter here set to minimal working possibility, in reality it should be larger
### e.g. default of c(10,50,100)
estimResults<-estimate.evolutionary.model(phyltree,OUOUdata,regimes=regimes,
root.regime="small",M.error=NULL,repeats=1,model.setups=model_setups,predictors=c(3),
kY=2,doPrint=TRUE,pESS=NULL,maxiter=c(1,1,1))

### After this step you can look at the best estimated model and use the
### parametric.bootstrap() function to obtain bootstrap confidence intervals

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
##D ### Define SDE parameters to be able to simulate data under the OUOU model.
##D OUOUparameters<-list(vY0=matrix(c(1,-1,0.5),nrow=3,ncol=1),
##D A=rbind(c(9,0,0),c(0,5,0),c(0,0,1)),mPsi=cbind("small"=c(1,-1,0.5),"large"=c(-1,1,0.5)),
##D Syy=rbind(c(1,0.25,0.3),c(0,1,0.2),c(0,0,1)))
##D 
##D ### Now simulate the data.
##D OUOUdata<-simulOUCHProcPhylTree(phyltree,OUOUparameters,regimes,NULL)
##D OUOUdata<-OUOUdata[phyltree$tip.label,,drop=FALSE]
##D 
##D ## set up for two very simple (for example usage) models to compare between
##D ## in a real analysis you should carefully choose between what models
##D ## you want to do model selection, the default 
##D ## model_setups<-NULL provides a wide selection of models
##D 
##D model_setups<-list(list(evolmodel="bm"),list(evolmodel="ouch",
##D "Atype"="SingleValueDiagonal","Syytype"="SingleValueDiagonal","diagA"="Positive"))
##D 
##D ### Try to recover the parameters of the OUOU model.
##D estimResults<-estimate.evolutionary.model(phyltree,OUOUdata,regimes=regimes,
##D root.regime="small",M.error=NULL,repeats=3,model.setups=model_setups,predictors=c(3),
##D kY=2,doPrint=TRUE,pESS=NULL,maxiter=c(10,50,100))
## End(Not run)



