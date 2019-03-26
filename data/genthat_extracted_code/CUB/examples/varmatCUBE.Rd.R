library(CUB)


### Name: varmatCUBE
### Title: Variance-covariance matrix for CUBE models
### Aliases: varmatCUBE
### Keywords: htest

### ** Examples

m<-7; n<-500
pai<-0.83; csi<-0.19; phi<-0.045
ordinal<-simcube(n,m,pai,csi,phi)
param<-c(pai,csi,phi)
varmat<-varmatCUBE(ordinal,m,param)
##########################
### Including covariates
## No test: 
data(relgoods)
m<-10
naord<-which(is.na(relgoods$Tv))
nacov<-which(is.na(relgoods$BirthYear))
na<-union(naord,nacov)
age<-2014-relgoods$BirthYear[-na]
lage<-log(age)-mean(log(age))
Y<-W<-Z<-lage
ordinal<-relgoods$Tv[-na]
estbet<-c(0.18,1.03); estgama<-c(-0.6,-0.3); estalpha<-c(-2.3,0.92)
param<-c(estbet,estgama,estalpha)
varmat<-varmatCUBE(ordinal,m,param,Y=Y,W=W,Z=Z,expinform=TRUE)
## End(No test)



