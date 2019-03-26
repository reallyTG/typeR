library(CUB)


### Name: cub0q
### Title: Main function for CUB models with covariates for the feeling
###   component
### Aliases: cub0q
### Keywords: internal

### ** Examples

#running donttest option since the proposed examples require a long time run for check 
## No test: 
data(relgoods)
m=10
ordinal=relgoods[,29]
gender=relgoods[,2]
data=na.omit(cbind(ordinal,gender))
ordinal=data[,1]
W=data[,2]
makeplot=TRUE
maxiter=500           
toler=1e-6 
cubfit=cub0q(m,ordinal,W, maxiter, toler, makeplot, summary=TRUE)
param=cubfit$estimates      # Final ML estimates
pai=param[1]                # Estimated uncertainty parameter
gama=param[2:length(param)] # Estimated coefficients for feeling covariates
maxlik=cubfit$loglik
varmat=cubfit$varmat
niter=cubfit$niter
BIC=cubfit$BIC
###########################
data(univer)
m=7
global=univer[,12]
freqserv=univer[,2]
vercub0q=cub0q(m,global,W=freqserv,maxiter=300,toler=1e-4,makeplot=FALSE)
param=vercub0q$estimates      # Final ML estimates
pai=param[1]                  # Estimated uncertainty parameter
gama=param[2:length(param)]   # Estimated coefficients for feeling covariates
maxlik=vercub0q$loglik
varmat=vercub0q$varmat
niter=vercub0q$niter
BIC=vercub0q$BIC
## End(No test)



