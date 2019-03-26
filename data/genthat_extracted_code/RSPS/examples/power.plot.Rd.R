library(RSPS)


### Name: power.plot
### Title: Provides plot of Estimated Power vs Sample Size
### Aliases: power.plot
### Keywords: Power.plot

### ** Examples

#--------------------------------------------------
power.poiss <- poiss.pow(n=c(5,10,15),lambda1=c(3),k=c(2,2.5,3),
alpha=0.05,seed = 20,numsim=100,monitor=TRUE)
power.poiss
power.plot(power.poiss,cutoff=c(0.8,0.9))
# Another example (takes longer to run)
#power.poiss <- poiss.pow(n=c(3,5,10,15,20),lambda1=c(3),k=c(1.5,2,2.5,3),
#alpha=0.001,seed = 20,numsim=500,monitor=TRUE)
#power.plot(power.poiss,cutoff=c(0.8,0.9))
#power.negbin <- negbin.pow(n=c(3,5,10,15,20),lambda1=c(3,5),k=c(1.5,2,2.5,3,3.5),
#disp=2,alpha=0.001,seed = 20,numsim=1000,monitor=TRUE)
#power.plot(power.negbin,cutoff=0.8)



