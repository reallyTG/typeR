library(tensorA)


### Name: mean.tensor
### Title: Mean and variance of tensors
### Aliases: mean.tensor var.tensor
### Keywords: multivariate

### ** Examples

 d1 <- c(a=2,b=2)
 d2 <- c("a'"=2,"b'"=2)
 # a mean tensor:
 m <- to.tensor(1:4,d1)             
 # a positive definite variance tensor:
 V <- delta.tensor(d1)+one.tensor(c(d1,d2))
 V
 # Simulate Normally distributed tensors with these moments:
 X <- (power.tensor(V,c("a","b"),c("a'","b'"),p=1/2)  %e%
      to.tensor(rnorm(1000*2*2),c(i=1000,d2))) + m
 # The mean
 mean.tensor(X,along="i")
 # Full tensorial covariance:
 var.tensor(X,along="i")
 # Variance of the slices  X[[b=1]] and X[[b=2]] :
 var.tensor(X,along="i",by="b")
 # Covariance of the slices X[[b=1]] and X[[b=2]] :
 var.tensor(X[[b=1]],X[[a=~"a'",b=2]],along="i")




