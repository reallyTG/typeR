library(latentnet)


### Name: as.mcmc.list.ergmm
### Title: Convert an ERGMM Object to an MCMC list object for Diagnostics.
### Aliases: as.mcmc.list.ergmm as.mcmc.ergmm
### Keywords: debugging graphs manip

### ** Examples


## No test: 
library(coda)
data(sampson)
monks.fit<-ergmm(samplike~euclidean(d=2,G=3))
monks.fit.mcmc<-as.mcmc.list(monks.fit)
plot(monks.fit.mcmc)
raftery.diag(monks.fit.mcmc)
## End(No test)



