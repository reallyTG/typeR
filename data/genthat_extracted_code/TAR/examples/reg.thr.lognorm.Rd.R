library(TAR)


### Name: reg.thr.lognorm
### Title: Identify the number of regimes and the corresponding thresholds
###   for a log-normal TAR model.
### Aliases: reg.thr.lognorm

### ** Examples

set.seed(12345678)
# Example 1, log-normal TAR model with 2 regimes
Z<-arima.sim(n=400,list(ar=c(0.5)))
l <- 2
r <- 0
K <- c(2,1)
theta <- matrix(c(-1,0.5,0.3,-0.5,-0.7,NA),nrow=l)
H <- c(1, 1.5)
#X <- simu.tar.lognorm(Z,l,r,K,theta,H)
#res <- reg.thr.lognorm(Z,X)
#res$L.est
#res$L.prob
#res$R.est
#res$R.CI




