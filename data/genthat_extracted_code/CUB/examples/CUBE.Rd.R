library(CUB)


### Name: CUBE
### Title: Main function for CUBE models
### Aliases: CUBE
### Keywords: #models internal

### ** Examples

## No test: 
data(relgoods)
ordinal<-na.omit(relgoods[,37])  
model<-CUBE(ordinal,starting=c(0.1,0.1,0.1))  
model$estimates        # Final ML estimates
model$loglik           # Maximum value of the log-likelihood function
model$varmat         
model$niter
model$BIC
######################## 
ordinal<-relgoods[,40]
cov<-relgoods[,2]
nona<-na.omit(cbind(ordinal,cov))
modelcovcsi<-CUBE(nona[,1],W=nona[,2])
modelcov<-CUBE(nona[,1],Y=nona[,2],W=nona[,2], Z=nona[,2])
modelcov$BIC
modelcovcsi$BIC
#######################################
data(univer)
ordinal<-univer[,8]
starting<-inibestcube(m,ordinal)
model<-CUBE(ordinal,starting=starting)
## End(No test)





