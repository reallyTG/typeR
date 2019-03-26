library(bayesdistreg)


### Name: simcnfB
### Title: Symmetric simultaneous bayesian confidence bands
### Aliases: simcnfB

### ** Examples

set.seed(14); m=matrix(rbeta(500,1,4),nrow = 5) + 1:5
DF = apply(m,1,mean); plot(1:5,DF,type="l",ylim = c(0,max(m)), xlab = "Index")
symCB<- simcnfB(DF,DFmat = m)
lines(1:5,DF-symCB,lty=2); lines(1:5,DF+symCB,lty=2)




