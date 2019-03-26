library(curstatCI)


### Name: ComputeConfIntervals
### Title: Pointwise Confidence Intervals under Current Status data
### Aliases: ComputeConfIntervals

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

# x vector
grid<-seq(0.1,1.9 ,by = 0.1)

# data-driven bandwidth vector
bw <- ComputeBW(data =A, x = grid)

# pointwise confidence intervals at grid points:
out<-ComputeConfIntervals(data = A,x =grid,alpha = 0.05, bw = bw)

left <- out$CI[,1]
right <- out$CI[,2]

plot(grid, out$SMLE,type ='l', ylim=c(0,1), main= "",ylab="",xlab="",las=1)
points(grid, left, col = 4)
points(grid, right, col = 4)
segments(grid,left, grid, right)




