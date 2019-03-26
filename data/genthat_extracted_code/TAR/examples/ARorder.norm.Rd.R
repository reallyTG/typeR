library(TAR)


### Name: ARorder.norm
### Title: Identify the autoregressive orders for a Gaussian TAR model
###   given the number of regimes and thresholds.
### Aliases: ARorder.norm

### ** Examples

set.seed(123456789)
Z<-arima.sim(n=300,list(ar=c(0.5)))
l <- 2
r <- 0
K <- c(2,1)
theta <- matrix(c(1,-0.5,0.5,-0.7,-0.3,NA), nrow=l)
H <- c(1, 1.5)
X <- simu.tar.norm(Z,l,r,K,theta,H)
#res <- ARorder.norm(Z,X,l,r)
#res$K.est
#res$K.prob



