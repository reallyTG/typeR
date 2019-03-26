library(RSPS)


### Name: poiss.samp
### Title: Estimates sample sizes for desired power using simulation from
###   Poisson distribution
### Aliases: poiss.samp
### Keywords: Poisson Sample.size

### ** Examples

power = c(0.7,0.8);lambda1=3;k=seq(2,3,0.5);
alpha=0.01;seed = 20;numsim=100
sample.poiss <- poiss.samp(power,lambda1,k,alpha,seed,numsim)
sample.poiss
# Another example (takes longer to run)
#power = seq(0.7,0.9,0.05);lambda1=3;k=seq(2,3,0.5);
#alpha=0.005;seed = 20;numsim=1000
#sample.poiss <- poiss.samp(power,lambda1,k,alpha,seed,numsim)
#sample.poiss



