library(condMVNorm)


### Name: pcmvnorm
### Title: Conditional Multivariate Normal Distribution
### Aliases: pcmvnorm
### Keywords: distribution multivariate

### ** Examples

n <- 10
A <- matrix(rnorm(n^2), n, n)
A <- A %*% t(A)

pcmvnorm(lower=-Inf, upper=1, mean=rep(1,n), sigma=A, 	dependent.ind=3, given.ind=c(1,4,7,9,10), 
	X.given=c(1,1,0,0,-1))

pcmvnorm(lower=-Inf, upper=c(1,2), mean=rep(1,n), 
	sigma=A, dep=c(2,5), given=c(1,4,7,9,10), 
	X=c(1,1,0,0,-1))

pcmvnorm(lower=-Inf, upper=c(1,2), mean=rep(1,n), sigma=A, 
	dep=c(2,5))




