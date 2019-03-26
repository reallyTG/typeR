library(CUB)


### Name: loglikCUB
### Title: Log-likelihood function for CUB models
### Aliases: loglikCUB
### Keywords: htest

### ** Examples

## Log-likelihood of a CUB model with no covariate
m<-9; n<-300
pai<-0.6; csi<-0.4
ordinal<-simcub(n,m,pai,csi)
param<-c(pai,csi)
loglikcub<-loglikCUB(ordinal,m,param)
##################################
## Log-likelihood of a CUB model with covariate for uncertainty
## No test: 
data(relgoods)
m<-10
naord<-which(is.na(relgoods$Physician))
nacov<-which(is.na(relgoods$Gender))
na<-union(naord,nacov)
ordinal<-relgoods$Physician[-na]; Y<-relgoods$Gender[-na]
bbet<-c(-0.81,0.93); ccsi<-0.2
param<-c(bbet,ccsi)
loglikcubp0<-loglikCUB(ordinal,m,param,Y=Y)
#######################
## Log-likelihood of a CUB model with covariate for feeling
data(relgoods)
m<-10
naord<-which(is.na(relgoods$Physician))
nacov<-which(is.na(relgoods$Gender))
na<-union(naord,nacov)
ordinal<-relgoods$Physician[-na]; W<-relgoods$Gender[-na]
pai<-0.44; gama<-c(-0.91,-0.7)
param<-c(pai,gama)
loglikcub0q<-loglikCUB(ordinal,m,param,W=W)
#######################
## Log-likelihood of a CUB model with covariates for both parameters
data(relgoods)
m<-10
naord<-which(is.na(relgoods$Walking))
nacovpai<-which(is.na(relgoods$Gender))
nacovcsi<-which(is.na(relgoods$Smoking))
na<-union(naord,union(nacovpai,nacovcsi))
ordinal<-relgoods$Walking[-na]
Y<-relgoods$Gender[-na]; W<-relgoods$Smoking[-na]
bet<-c(-0.45,-0.48); gama<-c(-0.55,-0.43)
param<-c(bet,gama)
loglikcubpq<-loglikCUB(ordinal,m,param,Y=Y,W=W)
#######################
### Log-likelihood of a CUB model with shelter effect
m<-7; n<-400
pai<-0.7; csi<-0.16; delta<-0.15
shelter<-5
ordinal<-simcubshe(n,m,pai,csi,delta,shelter)
pai1<- pai*(1-delta); pai2<-1-pai1-delta
param<-c(pai1,pai2,csi)
loglik<-loglikCUB(ordinal,m,param,shelter=shelter)
##############
### Log-likelihood of a GeCUB
data(univer)
ordinal<-univer$officeho; Y<-W<-X<-univer$gender;
modelgecub<-GEM(Formula(ordinal~Y|W|X),family="cub",shelter=7,maxiter=100)
logLik(modelgecub)
param<-rep(0.1,6)
loglik<-loglikCUB(ordinal,m=7,param=param,shelter=7,Y=Y,W=W,X=X)
## End(No test)




