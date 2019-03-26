library(BAEssd)


### Name: binom2.1sided
### Title: Binomial Suite: Two Sample, One Sided
### Aliases: binom2.1sided

### ** Examples

############################################################
# Generate the suite of functions for a one-sample binomial
# with a two-sided test. Consider the hypothesis
#      H0: p[1]<=p[2]   vs.  H1: p[1]>p[2]
#
# with a uniform prior on p[1] and a uniform prior on p[2].

# generate suite
f3 <- binom2.1sided(a1=1,b1=1,a2=1,b2=1)

# attach suite
attach(f3)

# calculate the Bayes factor when the observed data are
#   n = 30, x[1] = 10, x[2] = 20
logbf(x=matrix(c(10,20),ncol=2,nrow=1),n=30)

# perform sample size calculation with TE bound of 0.25 and weight 0.5
ssd.binom(alpha=0.25,w=0.5,logm=logm,two.sample=TRUE)

# detain suite
detach(f3)



