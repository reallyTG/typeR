library(tmvtnorm)


### Name: rtmvt
### Title: Sampling Random Numbers From The Truncated Multivariate Student
###   t Distribution
### Aliases: rtmvt
### Keywords: distribution multivariate

### ** Examples

###########################################################
#
# Example 1
#
###########################################################	

# Draw from multi-t distribution without truncation
X1 <- rtmvt(n=10000, mean=rep(0, 2), df=2)
X2 <- rtmvt(n=10000, mean=rep(0, 2), df=2, lower=c(-1,-1), upper=c(1,1))

###########################################################
#
# Example 2
#
###########################################################	

df = 2
mu = c(1,1,1)
sigma = matrix(c(  1, 0.5, 0.5,
                 0.5,   1, 0.5,
                 0.5, 0.5,   1), 3, 3)
lower = c(-2,-2,-2)
upper = c(2, 2, 2)

# Rejection sampling
X1 <- rtmvt(n=10000, mu, sigma, df, lower, upper)

# Gibbs sampling without thinning
X2 <- rtmvt(n=10000, mu, sigma, df, lower, upper, 
  algorithm="gibbs")

# Gibbs sampling with thinning
X3 <- rtmvt(n=10000, mu, sigma, df, lower, upper, 
  algorithm="gibbs", thinning=2)	
   
plot(density(X1[,1], from=lower[1], to=upper[1]), col="red", lwd=2,
  main="Gibbs vs. Rejection")
lines(density(X2[,1], from=lower[1], to=upper[1]), col="blue", lwd=2)
legend("topleft",legend=c("Rejection Sampling","Gibbs Sampling"), 
  col=c("red","blue"), lwd=2)

acf(X1)  # no autocorrelation in Rejection sampling
acf(X2)  # strong autocorrelation of Gibbs samples
acf(X3)  # reduced autocorrelation of Gibbs samples after thinning	



