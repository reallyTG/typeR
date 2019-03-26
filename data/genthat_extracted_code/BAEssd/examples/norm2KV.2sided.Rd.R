library(BAEssd)


### Name: norm2KV.2sided
### Title: Normal Suite: Two Sample, Two Sided, Known Variance
### Aliases: norm2KV.2sided

### ** Examples

############################################################
# Generate the suite of functions for a two-sample normal
# with a two-sided test. Consider the hypothesis
#      H0: theta[1]==theta[2]  vs.  H1: theta[1]!=theta[2]
#
# with a known variance of 3.

# generate suite
f7 <- norm2KV.2sided(sigma=3,prob=0.5,mu0=0,tau0=1,mu1=2,tau1=1,mu2=2,tau2=1)

# attach suite
attach(f7)

# calculate the Bayes Factor for the following observed data
#   n = 30, xbar[1] = -1, xbar[2] = 1
logbf(xbar=matrix(c(-1,1),nrow=1,ncol=2),n=30)

# perform sample size calculation with TE bound of 0.5 and weight 0.9
#  - due to a need for a Monte Carlo implementation of this procedure, this
#    problem can take significantly longer to solve, compared to other examples.
#    Thus, for this example, a large error bound and weight were chosen to 
#    decrease computation time while illustrating the function.
ssd.norm2KV.2sided(alpha=0.5,w=0.9)

# detain suite
detach(f7)



