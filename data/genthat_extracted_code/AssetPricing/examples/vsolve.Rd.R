library(AssetPricing)


### Name: vsolve
### Title: Solve for expected value of assets.
### Aliases: vsolve
### Keywords: math

### ** Examples

#
# In these examples "qmax" has been set equal to 5 which is
# an unrealistically low value for the total number of assets.
# This is done so as to reduce the time for package checking on CRAN.
#
S <- expression(exp(-kappa*x/(1+gamma*exp(-beta*t))))
attr(S,"parvec") <- c(kappa=10/1.5,gamma=9,beta=1)
lambda1 <- function(tt){
	84*(1-tt)
}

# Optimal pricing policy assuming customers arrive singly:
X <- xsolve(S=S,lambda=lambda1,gprob=1,tmax=1,qmax=5)
lambda2 <- function(tt){
	36*(1-tt)
}
# Expected values if the customers actually arrive in groups, using the
# (sub-optimal) pricing policy based on the (erroneous) assumption that
# they arrive singly.  Note that the two scenarios are ``comparable'' in
# that the expected total number of customers is 42 in each case.
V <- vsolve(S=S,lambda=lambda2,gprob=(5:1)/15,x=X$x,alpha=0.5)



