library(bayesdistreg)


### Name: asymcnfB
### Title: Asymmetric simultaneous bayesian confidence bands
### Aliases: asymcnfB

### ** Examples

set.seed(14); m=matrix(rbeta(500,1,4),nrow = 5) + 1:5
DF = apply(m,1,mean); plot(1:5,DF,type="l",ylim = c(min(m),max(m)), xlab = "Index")
asyCB<- asymcnfB(DF,DFmat = m)
lines(1:5,DF-asyCB$cmin,lty=2); lines(1:5,DF+asyCB$cmax,lty=2)




