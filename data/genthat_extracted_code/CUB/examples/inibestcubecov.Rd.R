library(CUB)


### Name: inibestcubecov
### Title: Preliminary parameter estimates for CUBE models with covariates
### Aliases: inibestcubecov
### Keywords: htest utilities

### ** Examples

data(relgoods)
m<-10 
naord<-which(is.na(relgoods$Tv))
nacovpai<-which(is.na(relgoods$Gender))
nacovcsi<-which(is.na(relgoods$year.12))
nacovphi<-which(is.na(relgoods$EducationDegree))
na<-union(union(naord,nacovpai),union(nacovcsi,nacovphi))
ordinal<-relgoods$Tv[-na]
Y<-relgoods$Gender[-na]
W<-relgoods$year.12[-na]
Z<-relgoods$EducationDegree[-na]
ini<-inibestcubecov(m,ordinal,Y,W,Z)
p<-NCOL(Y)
q<-NCOL(W)
inibet<-ini[1:(p+1)]               # Preliminary estimates for uncertainty 
inigama<-ini[(p+2):(p+q+2)]        # Preliminary estimates for feeling 
inialpha<-ini[(p+q+3):length(ini)] # Preliminary estimates for overdispersion



