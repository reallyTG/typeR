library(bnormnlr)


### Name: chainsum
### Title: Function to summarize chain results of MCMC simulation obtained
###   from bnlr
### Aliases: chainsum

### ** Examples

utils::data(muscle, package = "MASS")
plot(muscle$Conc,muscle$Length)

###mean and variance functions
fmu<-function(param,cov){ param[1] + param[2]*exp(-cov/exp(param[3]))}
fsgma<-function(param,cov){drop(exp(cov%*%param))}

##Note: use more MCMC chains (i.e NC=10000) for more accurate results.
m1b<-bnlr(y=muscle$Length,f1=fmu,f2=fsgma,x=muscle$Conc,
z=cbind(1,muscle$Conc),bta0=c(20,-30,0),gma0=c(.5,.5),Nc=1200)
chainsum(m1b$chains,burn=1:200)



