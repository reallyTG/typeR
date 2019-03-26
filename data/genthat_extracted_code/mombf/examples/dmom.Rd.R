library(mombf)


### Name: dmom
### Title: Moment prior and inverse moment prior.
### Aliases: dmom dimom pmom pimom qmom qimom demom demom-methods
###   demom,data.frame-method demom,matrix-method demom,vector-method pemom
### Keywords: distribution htest

### ** Examples

#evaluate and plot the moment and inverse moment priors
library(mombf)
tau <- 1
thseq <- seq(-3,3,length=1000)
plot(thseq,dmom(thseq,tau=tau),type='l',ylab='Prior density')
lines(thseq,dimom(thseq,tau=tau),lty=2,col=2)



