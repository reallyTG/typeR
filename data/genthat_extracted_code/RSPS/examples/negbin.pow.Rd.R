library(RSPS)


### Name: negbin.pow
### Title: Estimates power for given sample size using simulation from
###   Negative Binomial distribution
### Aliases: negbin.pow
### Keywords: Negative.Binomial Power

### ** Examples

power.negbin <- negbin.pow(n=c(5,10),lambda1=c(3,5),
k=c(2,3),disp=2,alpha=0.001,seed = 20,
numsim=100,monitor=TRUE)
power.plot(power.negbin)
# Another example (takes longer to run)
#power.negbin <- negbin.pow(n=c(3,5,10,15),lambda1=c(3,5),
#k=c(2,2.5,3),disp=2,alpha=0.001,seed = 20,
#numsim=1000,monitor=TRUE)
#head(power.negbin)



