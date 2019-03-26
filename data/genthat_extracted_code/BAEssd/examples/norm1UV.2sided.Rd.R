library(BAEssd)


### Name: norm1UV.2sided
### Title: Normal Suite: One Sample, Two Sided, Unknown Variance
### Aliases: norm1UV.2sided

### ** Examples

############################################################
# Generate the suite of functions for a one-sample normal
# with a two-sided test. Consider the hypothesis
#      H0: theta==0  vs.  H1: theta!=0
#
# with a normal prior for theta with prior mean 2 and 
# scale of 1/3 for the standard deviation. The prior proability
# of the null hypothesis is set to 0.5. The prior density
# on sigma2 is taken to be InverseGamma with parameters
# 11 and 30 for the shape and rate.

# generate suite
f8 <- norm1UV.2sided(theta0=0,prob=0.5,mu=2,scale=(1/3),shape=11,rate=30)

# attach suite
attach(f8)

# calculate the Bayes Factor for the following observed data
#   n = 30, xbar = 1, s2 = 2
logbf(xbar=1,s2=2,n=30)

# perform sample size calculation with TE bound of 0.25 and weight 0.5
ssd.norm1UV.2sided(alpha=0.25,w=0.5)

# detain suite
detach(f8)



