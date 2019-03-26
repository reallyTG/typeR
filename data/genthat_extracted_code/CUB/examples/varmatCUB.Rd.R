library(CUB)


### Name: varmatCUB
### Title: Variance-covariance matrix for CUB models
### Aliases: varmatCUB
### Keywords: htest

### ** Examples

data(univer)
m<-7
### CUB model with no covariate
pai<-0.87; csi<-0.17 
param<-c(pai,csi)
varmat<-varmatCUB(univer$global,m,param)
#######################
### and with covariates for feeling
data(univer)
m<-7
pai<-0.86; gama<-c(-1.94,-0.17)
param<-c(pai,gama)
ordinal<-univer$willingn; W<-univer$gender      
varmat<-varmatCUB(ordinal,m,param,W)
#######################
### CUB model with uncertainty covariates
data(relgoods)
m<-10
naord<-which(is.na(relgoods$Physician))
nacov<-which(is.na(relgoods$Gender))
na<-union(naord,nacov)
ordinal<-relgoods$Physician[-na]
Y<-relgoods$Gender[-na]
bet<-c(-0.81,0.93); csi<-0.20
varmat<-varmatCUB(ordinal,m,param=c(bet,csi),Y=Y)
#######################
### and with covariates for both parameters
data(relgoods)
m<-10
naord<-which(is.na(relgoods$Physician))
nacov<-which(is.na(relgoods$Gender))
na<-union(naord,nacov)
ordinal<-relgoods$Physician[-na]
W<-Y<-relgoods$Gender[-na]
gama<-c(-0.91,-0.7); bet<-c(-0.81,0.93)
varmat<-varmatCUB(ordinal,m,param=c(bet,gama),Y=Y,W=W)
#######################
### Variance-covariance for a CUB model with shelter
m<-8; n<-300
pai1<-0.5; pai2<-0.3; csi<-0.4
shelter<-6
pr<-probcubshe1(m,pai1,pai2,csi,shelter)
ordinal<-sample(1:m,n,prob=pr,replace=TRUE)
param<-c(pai1,pai2,csi)
varmat<-varmatCUB(ordinal,m,param,shelter=shelter)



