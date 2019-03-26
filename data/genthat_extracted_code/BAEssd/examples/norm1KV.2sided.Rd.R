library(BAEssd)


### Name: norm1KV.2sided
### Title: Normal Suite: One Sample, Two Sided, Known Variance
### Aliases: norm1KV.2sided

### ** Examples

############################################################
# Generate the suite of functions for a one-sample normal
# with a two-sided test. Consider the hypothesis
#      H0: theta==0  vs.  H1: theta!=0
#
# with a normal prior for theta with prior mean 2 and 
# prior standard deviation 1. The known standard 
# deviation for the population is 5. The prior proability
# of the null hypothesis is set to 0.5.

# generate suite
f6 <- norm1KV.2sided(sigma=5,theta0=0,prob=0.5,mu=2,tau=1)

# attach suite
attach(f6)

# plot the prior and posterior density when the observed data is
#  n = 30, xbar = 1.
mus <- seq(-5,5,0.01)
mu1 <- prior(mus)
mu2 <- post(mus,xbar=1,n=30)

plot(c(mu1,mu2)~rep(mus,2),type="n",ylab="Density",xlab="mu",main="")
lines(mu1~mus,lty=1,lwd=2)
lines(mu2~mus,lty=2,lwd=2)

# perform sample size calculation with TE bound of 0.25 and weight 0.5
#   using both the example-specific function as well as the general.
ssd.norm1KV(alpha=0.25,w=0.5,logm=logm)
ssd.norm1KV.2sided(alpha=0.25,w=0.5)

# detain suite
detach(f6)



