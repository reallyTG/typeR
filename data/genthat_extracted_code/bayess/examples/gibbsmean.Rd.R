library(bayess)


### Name: gibbsmean
### Title: Gibbs sampler on a mixture posterior distribution with unknown
###   means
### Aliases: gibbsmean
### Keywords: Gibbs mixture of distributions

### ** Examples

dat=plotmix(plottin=FALSE)$sample
simu=gibbsmean(0.7,dat,niter=100)
plot(simu,pch=19,cex=.5,col="sienna",xlab=expression(mu[1]),ylab=expression(mu[2]))



