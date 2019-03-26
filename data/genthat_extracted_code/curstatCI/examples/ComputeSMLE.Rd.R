library(curstatCI)


### Name: ComputeSMLE
### Title: Smoothed Maximum Likelihood Estimator
### Aliases: ComputeSMLE

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
grid <-seq(0,2 ,by = 0.01)

# bandwidth vector
h<-rep(2*n^-0.2,length(grid))

smle <-ComputeSMLE(A,grid,h)
plot(grid, smle,type ='l', ylim=c(0,1), main= "",ylab="",xlab="",las=1)





