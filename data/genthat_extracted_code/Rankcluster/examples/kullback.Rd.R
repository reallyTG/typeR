library(Rankcluster)


### Name: kullback
### Title: Kullback-Leibler divergence
### Aliases: kullback

### ** Examples

proportion1=c(0.4,0.6)
pi1=matrix(c(0.8,0.75),nrow=2)
mu1=matrix(c(1,2,3,4,4,2,1,3),nrow=2,byrow=TRUE)
proportion2=c(0.43,0.57)
pi2=matrix(c(0.82,0.7),nrow=2)
mu2=matrix(c(1,2,3,4,4,2,1,3),nrow=2,byrow=TRUE)
dK=kullback(proportion1,pi1,mu1,proportion2,pi2,mu2,4)



