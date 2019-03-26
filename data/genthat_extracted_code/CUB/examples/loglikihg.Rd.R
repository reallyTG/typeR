library(CUB)


### Name: loglikIHG
### Title: Log-likelihood function for IHG models
### Aliases: loglikIHG
### Keywords: htest

### ** Examples

#### Log-likelihood of an IHG model with no covariate
m<-10; theta<-0.14; n<-300
ordinal<-simihg(n,m,theta)
loglik<-loglikIHG(ordinal,m,param=theta)
##################################
#### Log-likelihood of a IHG model with covariate 
data(relgoods)
m<-10
naord<-which(is.na(relgoods$HandWork))
nacov<-which(is.na(relgoods$Gender))
na<-union(naord,nacov)
ordinal<-relgoods$HandWork[-na]; U<-relgoods$Gender[-na]
nu<-c(-1.55,-0.11)     # first entry: intercept term
loglik<-loglikIHG(ordinal,m,param=nu,U=U); loglik



