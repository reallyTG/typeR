library(TSA)


### Name: garch.sim
### Title: Simulate a GARCH process
### Aliases: garch.sim
### Keywords: methods

### ** Examples

set.seed(1235678)
garch01.sim=garch.sim(alpha=c(.01,.9),n=500)
plot(garch01.sim,type='l', main='',ylab=expression(r[t]),xlab='t')



