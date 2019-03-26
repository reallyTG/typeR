library(CUB)


### Name: IHG
### Title: Main function for IHG models
### Aliases: IHG
### Keywords: internal

### ** Examples

## No test: 
data(relgoods)
m<-10
ordinal<-na.omit(relgoods[,41]) 
model<-IHG(ordinal)
theta<-model$estimates      # ML estimates for the preference parameter theta
maxlik<-model$loglik
sqerrst<-model$varmat         # Squared standard error of theta
BICIHG<-model$BIC
#################################
ordinal<-relgoods[,41]
gender<-relgoods[,9]
data<-na.omit(cbind(ordinal,gender))
modelcov<-IHG(data[,1],U=data[,2])
omega<-modelcov$estimates     #  ML estimates (intercept term: omega[1])
maxlik<-modelcov$loglik
varmat<-modelcov$varmat
BICcov<-modelcov$BIC
## End(No test)



