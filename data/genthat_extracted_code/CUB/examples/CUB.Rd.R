library(CUB)


### Name: CUB
### Title: Main function for CUB models
### Aliases: CUB
### Keywords: internal

### ** Examples

## No test: 
data(relgoods)
ordinal<-na.omit(relgoods[,40]) 
model<-CUB(ordinal)     
estpar<-model$estimates  # Estimated parameter vector (pai,csi)
maxlik<-model$loglik     # Log-likelihood function at ML estimates
vmat<-model$varmat
nniter<-model$niter
BICCUB<-model$BIC
################
## CUB model with shelter effect
data(univer)
officeho<-univer[,10]
model<-CUB(officeho,shelter=7)
BICcub<-model$BIC
################
## CUB model with covariates for all components - GeCub
data(univer)
officeho<-univer[,10]
gender<-relgoods[,7]
model<-CUB(officeho,shelter=7,Y=gender,W=gender,X=gender)
BICcub<-model$BIC
################
## CUB model with covariate for uncertainty
data(relgoods)
ordinal<-relgoods[,26] 
gender<-relgoods[,7]
data<-na.omit(cbind(ordinal,gender))
modelcovpai<-CUB(data[,1],Y=data[,2])
BICcovpai<-modelcovpai$BIC
## CUB model with covariate for feeling
data(univer)
ordinal<-univer[,12]
freqserv<-univer[,2]
modelcovcsi<-CUB(ordinal,W=freqserv)
##################
## CUB model with covariates for both components
data(univer)
gender<-univer[,4]
lage<-log(univer[,3])-mean(log(univer[,3]))
ordinal<-univer[,12]
maxiter<-500; toler<-1e-6;
model<-CUB(ordinal,Y=gender,W=lage) 
param<-model$estimates
bet<-param[1:2]      # ML estimates of coefficients for uncertainty covariate
gama<-param[3:4]     # ML estimates of coefficients for feeling covariate
## End(No test)



