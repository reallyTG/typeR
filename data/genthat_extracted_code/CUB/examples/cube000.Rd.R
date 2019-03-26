library(CUB)


### Name: cube000
### Title: Main function for CUBE models without covariates
### Aliases: cube000
### Keywords: #models internal

### ** Examples

### Applying donttest option since the proposed examples require long time run for check 
## No test: 
data(relgoods)
m=10
ordinal=na.omit(relgoods[,37])
starting = rep(0.1, 3)                              
fitcube=cube000(m, ordinal, starting, maxiter=500, toler=1e-6, makeplot=TRUE, expinform=FALSE,
        summary=T)
param=fitcube$estimates
pai=param[1]           # ML estimate for the uncertainty parameter
csi=param[2]           # ML estimate for the feeling parameter
phi=param[3]           # ML estimate for the overdispersion parameter
maxlik=fitcube$loglik 
niter=fitcube$niter
BIC=fitcube$BIC
###################
data(univer)
m=7
ordinal=univer[,8]
starting=inibestcube(m,ordinal)    
model=cube000(m,ordinal,starting,maxiter=200,toler=1e-4,makeplot=TRUE,expinform=TRUE,summary=F)
param=model$estimates   # Final ML estimates (pai,csi,phi)
maxlik=model$loglik
model$varmat
model$niter
model$BIC
## End(No test)



