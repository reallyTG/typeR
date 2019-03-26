library(SmartSifter)


### Name: Test
### Title: Test
### Aliases: Test

### ** Examples

## The parametric version
initial=matrix(c(0.5,0,0,1,0,0,1,0.5,1,1,1,0,0,1),nrow=1)
const = c(0,1,2,0.1,0.1,2,2)
param=TRUE
y=matrix(c(1,3,1,0,1,1),nrow=2)
smart = Train(y,param,const,initial)$smart
const[1] = Train(y,param,const,initial)$N
y=matrix(c(2,1,0),nrow=1)
smart = Test(y,param,smart,const,initial)$smart
HellingerScore = Test(y,param,smart,const,initial)$HellingerScore
LogLoss = Test(y,param,smart,const,initial)$LogLoss
const[1] = Test(y,param,smart,const,initial)$N
##The nonparametric version
param=FALSE
const = c(0,1,2,0.1,0.1,2,1)
initial = matrix(c(0,0,1,1),nrow=1)
y=matrix(c(1,3,1,0,1,1),nrow=2)
smart = Train(y,param,const,initial)$smart
const[1] = Train(y,param,const,initial)$N
y=matrix(c(2,1,0),nrow=1)
smart = Test(y,param,smart,const,initial)$smart
HellingerScore = Test(y,param,smart,const,initial)$HellingerScore
LogLoss = Test(y,param,smart,const,initial)$LogLoss
const[1] = Test(y,param,smart,const,initial)$N



