library(AssetPricing)


### Name: xsolve
### Title: Optimal pricing policy
### Aliases: xsolve
### Keywords: math

### ** Examples

#
# In these examples "qmax" has been set equal to 5 which is
# an unrealistically low value for the total number of assets.
# This is done so as to reduce the time for package checking on CRAN.
#
# Smooth price sensitivity function.
S <- expression(exp(-kappa*x/(1+gamma*exp(-beta*t))))
attr(S,"parvec") <- c(kappa=10/1.5,gamma=9,beta=1)

# Optimal pricing policy assuming customers arrive singly:
lambda1 <- function(tt){
	84*(1-tt)
}
X1 <- xsolve(S=S,lambda=lambda1,gprob=1,tmax=1,qmax=5,
             type="sip",verbInt=5)
# Optimal pricing policy assuming customers arrive in groups of
# size up to 5, with group size probabilities 1/3, 4/15, 1/5, 2/15,
# and 1/15 respectively.
lambda2 <- function(tt){
	36*(1-tt)
}
X2 <- xsolve(S=S,lambda=lambda2,gprob=(5:1)/15,tmax=1,qmax=5,
             type="sip", alpha=0.5,verbInt=5)

# Note that the intensity functions lambda1() and lambda2() are
# such that the expected total number of customers is 42 in each case.

# Discrete prices:
lambda3 <- function(t){42}
S      <- function(x,t){
                e <- numeric(2)
                e[x==1] <- exp(-2*t)
                e[x==0.6] <- 1.0
                e
          }
X3 <- xsolve(S=S,lambda=lambda3,gprob=1,tmax=1,qmax=5,prices=c(1,0.6),
             type="sip",verbInt=5)

# Piecewise linear price sensitivity function.
#
# Take S as in the example for buildS.
# This takes a loonnngggg time; the procedure is slow
# in the piecewise linear setting.
## Not run: 
##D l0 <- get("lambda",envir=environment(get("alpha",envir=environment(S))[[1]]))
##D lambda4 <- function(t){apply(l0(t),1,sum)}
##D X4 <- xsolve(S=S,lambda=lambda4,gprob=(5:1)/15,qmax=30,type="sip",
##D                    alpha=0.5,verbInt=20)
## End(Not run)



