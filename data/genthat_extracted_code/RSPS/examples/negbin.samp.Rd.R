library(RSPS)


### Name: negbin.samp
### Title: Estimates sample sizes for desired power using simulation from
###   Negative Binomial distribution
### Aliases: negbin.samp
### Keywords: Negative.Binomial Sample.size

### ** Examples

#--------------------------------------------------
power = c(0.7,0.8);lambda1=3;k=c(2,3);
disp=2;alpha=0.1;seed = 20;numsim=100
sample.negbin <- negbin.samp(power,lambda1,k,disp,alpha,seed,numsim)
head(sample.negbin)
# Another example (takes longer to run)
#power = seq(0.7,0.95,0.05);lambda1=3;k=c(2,2.5,3);
#disp=2;alpha=0.005;seed = 20;numsim=1000
#sample.negbin <- negbin.samp(power,lambda1,k,disp,alpha,seed,numsim)
#head(sample.negbin)



