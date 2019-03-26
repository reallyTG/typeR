library(CUB)


### Name: loglikCUBE
### Title: Log-likelihood function for CUBE models
### Aliases: loglikCUBE
### Keywords: htest

### ** Examples

#### Log-likelihood of a CUBE model with no covariate
m<-7; n<-400
pai<-0.83; csi<-0.19; phi<-0.045
ordinal<-simcube(n,m,pai,csi,phi)
loglik<-loglikCUBE(ordinal,m,param=c(pai,csi,phi))
##################################
#### Log-likelihood of a CUBE model with covariate for feeling
data(relgoods)
m<-10
nacov<-which(is.na(relgoods$BirthYear))
naord<-which(is.na(relgoods$Tv))
na<-union(nacov,naord)
age<-2014-relgoods$BirthYear[-na]
lage<-log(age)-mean(log(age))
ordinal<-relgoods$Tv[-na]; W<-lage
pai<-0.63; gama<-c(-0.61,-0.31); phi<-0.16
param<-c(pai,gama,phi)
loglik<-loglikCUBE(ordinal,m,param,W=W)
########## Log-likelihood of a CUBE model with covariates for all parameters
Y<-W<-Z<-lage
bet<-c(0.18, 1.03); gama<-c(-0.6, -0.3); alpha<-c(-2.3,0.92)
param<-c(bet,gama,alpha)
loglik<-loglikCUBE(ordinal,m,param,Y=Y,W=W,Z=Z)



