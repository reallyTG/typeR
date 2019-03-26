library(RSPS)


### Name: sample.plot
### Title: Provides plot of Estimated sample size vs power
### Aliases: sample.plot
### Keywords: Sample.plot

### ** Examples

power = seq(0.5,0.9,0.05);lambda1=3;k=seq(2,3,1);
alpha=0.05;seed = 20;numsim=100
sample.poiss <- poiss.samp(power,lambda1,k,alpha,seed,numsim)
sample.plot(sample.poiss,cutoff=c(0.8,0.9))
# Another example (takes longer to run)
#power = seq(0.5,0.9,0.05);lambda1=3;k=seq(2,3,0.5);
#alpha=0.005;seed = 20;numsim=1000
#sample.poiss <- poiss.samp(power,lambda1,k,alpha,seed,numsim)
#sample.plot(sample.poiss,cutoff=c(0.8,0.9))



