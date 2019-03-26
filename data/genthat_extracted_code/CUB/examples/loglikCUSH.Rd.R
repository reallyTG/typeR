library(CUB)


### Name: loglikCUSH
### Title: Log-likelihood function for CUSH models
### Aliases: loglikCUSH
### Keywords: htest

### ** Examples

## Log-likelihood of CUSH model without covariates
n<-300
m<-7
shelter<-2; delta<-0.4
ordinal<-simcush(n,m,delta,shelter)
loglik<-loglikCUSH(ordinal,m,param=delta,shelter)
#####################
## Log-likelihood of CUSH model with covariates
data(relgoods)
m<-10
naord<-which(is.na(relgoods$SocialNetwork))
nacov<-which(is.na(relgoods$Gender))
na<-union(nacov,naord)
ordinal<-relgoods$SocialNetwork[-na]; cov<-relgoods$Gender[-na]
omega<-c(-2.29, 0.62)
loglikcov<-loglikCUSH(ordinal,m,param=omega,shelter=1,X=cov)



