library(TAR)


### Name: ARorder.lognorm
### Title: Identify the autoregressive orders for a log-normal TAR model
###   given the number of regimes and thresholds.
### Aliases: ARorder.lognorm

### ** Examples

set.seed(12345678)
Z<-arima.sim(n=500,list(ar=c(0.5)))
l <- 2
r <- 0
K <- c(2,1)
theta <- matrix(c(1,0.5,-0.3,-0.5,-0.7,NA),nrow=l)
H <- c(1, 1.3)
X <- simu.tar.lognorm(Z,l,r,K,theta,H)
#res <- ARorder.lognorm(Z,X,l,r)
#res$K.est
#res$K.prob



