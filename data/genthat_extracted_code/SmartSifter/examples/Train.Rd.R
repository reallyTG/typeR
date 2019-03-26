library(SmartSifter)


### Name: Train
### Title: Train
### Aliases: Train

### ** Examples

##parametric model test
initial=matrix(c(0.5,0,0,1,0,0,1,0.5,1,1,1,0,0,1),nrow=1)
const = c(0,1,2,0.1,0.1,2,2)
param=TRUE
y=matrix(c(1,3,1,0,1,1),nrow=2)
smart = Train(y,param,const,initial)$smart
hellingerScore = Train(y,param,const,initial)$HellingerScore
logLoss = Train(y,param,const,initial)$LogLoss
const[1] = Train(y,param,const,initial)$N

##non-parametric model test
param=FALSE
const = c(0,1,2,0.1,0.1,2,1)
initial = matrix(c(0,0,1,1),nrow=1)
y=matrix(c(1,3,1,0,1,1),nrow=2)
smart = Train(y,param,const,initial)$smart
hellingerScore = Train(y,param,const,initial)$HellingerScore
logLoss = Train(y,param,const,initial)$LogLoss
const[1] = Train(y,param,const,initial)$N



