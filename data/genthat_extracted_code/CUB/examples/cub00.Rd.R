library(CUB)


### Name: cub00
### Title: Main function for CUB models without covariates
### Aliases: cub00
### Keywords: internal

### ** Examples

#Running donttest option since the proposed examples require a long time run for check 
## No test: 
data(univer)
m=7
ordinal=univer[,12]
model=cub00(m, ordinal, maxiter=500, toler=1e-6, makeplot=TRUE,summary=TRUE)
parest=model$estimates  #ML estimates (pai,csi)
maxlik=model$loglik
nniter=model$niter
vmat=model$varmat
BICCUB=model$BIC
#############################
informat=univer[,8]
model=cub00(m,informat,maxiter=500,toler=1e-6,makeplot=FALSE,summary=FALSE)
parest=model$estimates   #ML estimates (pai,csi)
maxlik=model$loglik
nniter=model$niter
vmat=model$varmat
BICCUB=model$BIC
## End(No test)



