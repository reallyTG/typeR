library(curstatCI)


### Name: ComputeMLE
### Title: Maximum Likelihood Estimator
### Aliases: ComputeMLE

### ** Examples

library(Rcpp)
library(curstatCI)

# sample size
n <- 1000

# Uniform data  U(0,2)
set.seed(2)
y <- runif(n,0,2)
t <- runif(n,0,2)
delta <- as.numeric(y <= t)

A<-cbind(t[order(t)], delta[order(t)], rep(1,n))
mle <-ComputeMLE(A)
plot(mle$x, mle$mle,type ='s', ylim=c(0,1), main= "",ylab="",xlab="",las=1)




