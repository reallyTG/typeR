library(RSPS)


### Name: RSPS-package
### Title: Provides estimates of power or sample size using empirical
###   approach.
### Aliases: RSPS-package RSPS
### Keywords: power sample.size simulation power.plots

### ** Examples

power.poiss <- poiss.pow(n=c(5,10,15),lambda1=c(3),k=c(2,2.5,3),
alpha=0.05,seed = 20,numsim=100,monitor=TRUE)
power.poiss
power.plot(power.poiss,cutoff=c(0.8,0.9))
# Another example (takes longer to run)
#power.poiss <- poiss.pow(n=c(3,5,10,15),lambda1=c(3),k=c(2,2.5,3),
#alpha=0.001,seed = 20,numsim=500,monitor=TRUE)
#power.poiss
#power.plot(power.poiss,cutoff=c(0.8,0.9))



