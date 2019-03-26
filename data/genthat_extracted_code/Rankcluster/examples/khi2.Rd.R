library(Rankcluster)


### Name: khi2
### Title: khi2 test
### Aliases: khi2

### ** Examples

proportion=c(0.4,0.6)
pi=c(0.8,0.75)
mu=matrix(c(1,2,3,4,4,2,1,3),nrow=2,byrow=TRUE)
#simulate a data set with declared parameters.
data=rbind(simulISR(proportion[1]*100,pi[1],mu[1,]),
simulISR(proportion[2]*100,pi[2],mu[2,]))
pval=khi2(data,proportion,mu,pi)



