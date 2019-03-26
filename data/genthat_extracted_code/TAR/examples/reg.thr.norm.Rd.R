library(TAR)


### Name: reg.thr.norm
### Title: Identify the number of regimes and the corresponding thresholds
###   for a Gaussian TAR model.
### Aliases: reg.thr.norm

### ** Examples

set.seed(12345678)
# Example 1, TAR model with 2 regimes
Z<-arima.sim(n=300,list(ar=c(0.5)))
l <- 2
r <- 0
K <- c(2,1)
theta <- matrix(c(1,-0.5,0.5,-0.7,-0.3,NA), nrow=l)
H <- c(1, 1.5)
X <- simu.tar.norm(Z,l,r,K,theta,H)
#res <- reg.thr.norm(Z,X)
#res$L.est
#res$L.prob
#res$R.est
#res$R.CI




