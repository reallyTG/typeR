library(Phase123)


### Name: PieceMCMC
### Title: Returns posterior distribution for key mixture model parameters
### Aliases: PieceMCMC

### ** Examples

n=100
Y=rexp(n,1)
I = rbinom(n,1,.9)
YE = rbinom(n,1,.5)
YT = rbinom(n,1,.5)
Dose = c(1,2,3,3.5,5)
Dose=(Dose-mean(Dose))/sd(Dose)
Doses = sample(1:5,n,replace=TRUE)
Doses=Dose[Doses]
B=2000
MaxObs = matrix(rep(0,length(Dose)*4),nrow=4)
prob=matrix(rep(0,length(Dose)*4),ncol=4)
prob=prob+1/4
MaxObs=MaxObs+max(Y)
G=PieceMCMC(Y,I,YE,YT,Doses,Dose,B,prob,MaxObs)



