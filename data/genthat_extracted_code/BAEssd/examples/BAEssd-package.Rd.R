library(BAEssd)


### Name: BAEssd-package
### Title: Bayesian Average Error approach to Sample Size Determination
### Aliases: BAEssd-package BAEssd

### ** Examples

############################################################
# Calculate the sample size required for a one-sample 
# normal experiment with known variance (sigma2=25) with
# the hypothesis of interest being
#     H0: theta==0   vs.   H1: theta!=0
#
# where theta is the mean of the normal distribution. For
# details on the prior used, see documentation for
# norm1KV.2sided().

# generate suite of functions
f1 <- norm1KV.2sided(sigma=5,theta0=0,prob=0.5,mu=2,tau=1)

# attach suite
attach(f1)

# calculate sample size for TE bound of 0.25 and weight 0.5
ssd.norm1KV.2sided(alpha=0.25,w=0.5)

# detach suite
detach(f1)


############################################################
# Calculate the sample size required for a two-sample 
# experiment with a binary response in which the hypothesis
# of interest is
#     H0: p1==p2   vs.   H1: p1!=p2
#
# where p1 is the response rate for group 1 and p2 is the
# response rate for group 2, independent samples. For
# details on the prior used, see documentation for
# binom2.2sided().

# generate suite of functions
f2 <- binom2.2sided(prob=0.5,a0=1,b0=1,a1=1,b1=1,a2=1,b2=1)

# attach suite
attach(f2)

# calculate sample size for TE bound of 0.25 and weight 0.5
#   - here the log marginal distribution (logm) is part of the suite.
ssd.binom(alpha=0.25,w=0.5,logm=logm,two.sample=TRUE)

# detach suite
detach(f2)



