library(mixtools)


### Name: wkde
### Title: Weighted Univariate (Normal) Kernel Density Estimate
### Aliases: wkde wkde.symm
### Keywords: file

### ** Examples

# Mixture with mv gaussian model
set.seed(100)
m <- 2 # no. of components
r <- 3 # no. of repeated measures (coordinates)
lambda <- c(0.4, 0.6)
mu <- matrix(c(0, 0, 0, 4, 4, 6), m, r, byrow=TRUE) # means 
sigma <- matrix(rep(1, 6), m, r, byrow=TRUE) # stdevs
centers <- matrix(c(0, 0, 0, 4, 4, 4), 2, 3, byrow=TRUE) # initial centers for est

blockid = c(1,1,2) # block structure of coordinates
n = 100
x <- rmvnormmix(n, lambda, mu, sigma) # simulated data
a <- npEM(x, centers, blockid, eps=1e-8, verb=FALSE)

par(mfrow=c(2,2))
u <- seq(min(x), max(x), len=200)
for(j in 1:2) { 
  for(b in 1:2) {
    xx <- as.vector(x[,a$blockid==b])
    wts <- rep(a$post[,j], length.out=length(xx))
    bw <- a$bandwidth
    title <- paste("j =", j, "and b =", b)
    plot(u, wkde(xx, u, wts, bw), type="l", main=title)
  }
}




