library(bayesdistreg)


### Name: jntCBOM
### Title: Montiel Olea and Plagborg-Moller (2018) confidence bands
### Aliases: jntCBOM

### ** Examples

set.seed(14); m=matrix(rbeta(500,1,4),nrow = 5) + 1:5
DF = apply(m,1,mean); plot(1:5,DF,type="l",ylim = c(min(m),max(m)), xlab = "Index")
jOMCB<- jntCBOM(DF,DFmat = m)
lines(1:5,jOMCB$CB[,1],lty=2); lines(1:5,jOMCB$CB[,2],lty=2)




