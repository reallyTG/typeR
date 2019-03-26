library(bayess)


### Name: hmmeantemp
### Title: Metropolis-Hastings with tempering steps for the mean mixture
###   posterior model
### Aliases: hmmeantemp
### Keywords: Metropolis-Hastings GLM mixture of distributions

### ** Examples

dat=plotmix(plot=FALSE)$sample
simu=hmmeantemp(dat,1000)
plot(simu,pch=19,cex=.5,col="sienna",xlab=expression(mu[1]),ylab=expression(mu[2]))



