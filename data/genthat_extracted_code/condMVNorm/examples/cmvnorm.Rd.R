library(condMVNorm)


### Name: cmvnorm
### Title: Conditional Multivariate Normal Density and Random Deviates
### Aliases: dcmvnorm rcmvnorm
### Keywords: distribution multivariate

### ** Examples

# 10-dimensional multivariate normal distribution
n <- 10
A <- matrix(rnorm(n^2), n, n)
A <- A %*% t(A)

# density of Z[c(2,5)] given Z[c(1,4,7,9)]=c(1,1,0,-1)
dcmvnorm(x=c(1.2,-1), mean=rep(1,n), sigma=A, 
	dependent.ind=c(2,5), given.ind=c(1,4,7,9), 
	X.given=c(1,1,0,-1))

dcmvnorm(x=-1, mean=rep(1,n), sigma=A, dep=3, given=c(1,4,7,9,10), X=c(1,1,0,0,-1))

dcmvnorm(x=c(1.2,-1), mean=rep(1,n), sigma=A, dep=c(2,5))

# gives an error since `x' and `dep' are incompatibe
#dcmvnorm(x=-1, mean=rep(1,n), sigma=A, dep=c(2,3), 
#	given=c(1,4,7,9,10), X=c(1,1,0,0,-1))

rcmvnorm(n=10, mean=rep(1,n), sigma=A, dep=c(2,5), 
	given=c(1,4,7,9,10), X=c(1,1,0,0,-1), 
	method="eigen")

rcmvnorm(n=10, mean=rep(1,n), sigma=A, dep=3, 
	given=c(1,4,7,9,10), X=c(1,1,0,0,-1), 
	method="chol")



