library(CUB)


### Name: cubecsi
### Title: Main function for CUBE models with covariates only for feeling
### Aliases: cubecsi
### Keywords: #models internal

### ** Examples

### Applying \donttest option since the proposed examples require a long run time for check 
## No test: 
data(relgoods)
m=10
ordinal=relgoods[,37]
age=2014-relgoods[,4]
lage=log(age)-mean(log(age))
nona=na.omit(cbind(ordinal,lage))
ordinal=nona[,1]
W=nona[,2]
starting=rep(0.1,4)     
fit=cubecsi(m, ordinal, W, starting, maxiter=100, toler=1e-3)
param=fit$estimates
pai=param[1]                        ## ML estimates for the uncertainty parameter
gama=param[2:(length(param)-1)]     ## ML estimates for the coefficients of the feeling covariates
phi=param[length(param)]            ## ML estimates for the overdispersion parameter
loglik=fit$loglik
varmat=fit$varmat
BIC=fit$BIC
##########################################################
data(univer)
m<-7 
ordinal=univer[,8]
gender=univer[,4]
initial=inibestcube(m,ordinal)
starting=inibestcubecsi(m,ordinal,W=gender,initial,maxiter=500,toler=1e-6)
fitcsi=cubecsi(m, ordinal, W=gender, starting, maxiter=100, toler=1e-3)
param=fitcsi$estimates
pai=param[1]                       ## ML estimates for the uncertainty parameter
gama=param[2:(length(param)-1)]    ## ML estimates for the coefficients of the feeling covariates
phi=param[length(param)]           ## ML estimates for the overdispersion parameter
loglik=fitcsi$loglik
varmat=fitcsi$varmat
BIC=fitcsi$BIC
## End(No test)



