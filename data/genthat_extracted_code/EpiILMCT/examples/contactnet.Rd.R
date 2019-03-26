library(EpiILMCT)


### Name: contactnet
### Title: Generate binary adjacency contact networks
### Aliases: contactnet
### Keywords: Simulation

### ** Examples

set.seed(66)
loc<- matrix(cbind(runif(50,0,10),runif(50,0,10)),ncol=2,nrow=50)
net1<- contactnet(type="powerlaw",location=loc,beta=1.5,alpha=0.5,
       plot=TRUE)
net2<- contactnet(type="Cauchy",location=loc,beta=0.5,plot=TRUE)
net3<- contactnet(type="random",location=loc,beta=0.08,plot=TRUE)



