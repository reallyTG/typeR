library(BAEssd)


### Name: binom1.2sided
### Title: Binomial Suite: One Sample, Two Sided
### Aliases: binom1.2sided

### ** Examples

############################################################
# Generate the suite of functions for a one-sample binomial
# with a two-sided test. Consider the hypothesis
#      H0: p==0.5   vs.  H1: p!=0.5
#
# with a uniform prior on p under the alternative and a
# prior probability of the null hypothesis equal to 0.5.

# generate suite
f2 <- binom1.2sided(p0=0.5,prob=0.5,a=1,b=1)

# attach suite
attach(f2)

# plot prior and posterior given x = 25, n = 30
#  - don't forget that point mass is not shown on plot
ps <- seq(0.01,0.99,0.01)
p1 <- prior(ps)
p2 <- post(ps,x=25,n=30)

plot(c(p1,p2)~rep(ps,2),type="n",ylab="Density",xlab="p",main="")
lines(p1~ps,lty=1,lwd=2)
lines(p2~ps,lty=2,lwd=2)

# perform sample size calculation with TE bound of 0.25 and weight 0.5
ssd.binom(alpha=0.25,w=0.5,logm=logm)

# detain suite
detach(f2)



