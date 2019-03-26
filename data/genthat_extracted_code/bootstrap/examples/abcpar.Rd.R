library(bootstrap)


### Name: abcpar
### Title: Parametric ABC Confidence Limits
### Aliases: abcpar
### Keywords: htest

### ** Examples

# binomial
# x is a p-vector of successes, n is a p-vector of 
#  number of trials
## Not run: 
##D S <- matrix(0,nrow=p,ncol=p)
##D S[row(S)==col(S)] <- x*(1-x/n)
##D mu <- function(eta,n){n/(1+exp(eta))}
##D etahat <- log(x/(n-x))
##D #suppose p=2 and we are interested in mu2-mu1
##D tt <- function(mu){mu[2]-mu[1]}
##D x <- c(2,4); n <- c(12,12)
##D a <- abcpar(x, tt, S, etahat,n)
## End(Not run)


