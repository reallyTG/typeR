library(RSPS)


### Name: poiss.pow
### Title: Estimates power for given sample size using simulation from
###   Poisson distribution
### Aliases: poiss.pow
### Keywords: Poisson Power

### ** Examples

#--------------------------------------------------
power.poiss <- poiss.pow(n=c(5,10,15),lambda1=c(3),k=c(2,3),
alpha=0.001,seed = 20,numsim=100,monitor=TRUE)
power.poiss
# Another example (takes longer to run)
#power.poiss <- poiss.pow(n=c(3,5,10,15),lambda1=c(3),k=c(2,2.5,3),
#alpha=0.001,seed = 20,numsim=1000,monitor=TRUE)
#power.poiss



