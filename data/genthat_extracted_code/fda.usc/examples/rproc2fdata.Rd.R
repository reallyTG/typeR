library(fda.usc)


### Name: rproc2fdata
### Title: Simulate several random processes.
### Aliases: rproc2fdata
### Keywords: datagen

### ** Examples

par(mfrow=c(3,2))
lent<-30
tt<-seq(0,1,len=lent)
mu<-fdata(rep(0,lent),tt)
plot(rproc2fdata(200,t=tt,sigma="OU",par.list=list("scale"=1)))
plot(rproc2fdata(200,mu=mu,sigma="OU",par.list=list("scale"=1)))
plot(rproc2fdata(200,t=tt,sigma="vexponential"))
plot(rproc2fdata(200,t=tt,sigma=1:lent))
plot(rproc2fdata(200,t=tt,sigma="brownian"))
plot(rproc2fdata(200,t=tt,sigma="wiener"))
#plot(rproc2fdata(200,seq(0,1,len=30),sigma="oo")) # this is an error 



