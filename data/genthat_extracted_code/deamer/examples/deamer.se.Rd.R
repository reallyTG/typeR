library(deamer)


### Name: deamerSE
### Title: Density estimation using an auxiliary sample of pure errors
### Aliases: deamerSE

### ** Examples


################################################################################
# Example 1: centered errors
set.seed(23456)
n = 1000; M = 500
x <- rchisq(n,3)
b=0.5
e <- rlaplace(n, 0, b)
y <- x + e

eps <- rlaplace(M, 0, b)

est <- deamerSE(y, eps)
est

curve(dchisq(x, 3), 0, 12, lwd=2, lty=3)
lines(est, lwd=2)
lines(density(y), lwd=2, lty=4)
legend("topright", bty="n", lty=c(1,3,4), lwd=2, legend=c("deamerSE", "true density", 
       "kernel density\nof noisy obs.")) 

################################################################################
# Example 2: non-centered errors
set.seed(23456)
n = 1000; M = 500
x <- rchisq(n,3)
mu=2; b=0.5
e <- rlaplace(n, mu, b)
y <- x + e

eps <- rlaplace(M, mu, b)

est <- deamerSE(y, eps, from=0, to=12)
est

curve(dchisq(x, 3), 0, 12, lwd=2, lty=3)
lines(est, lwd=2)
lines(density(y), lwd=2, lty=4)
legend("topright", bty="n", lty=c(1,3,4), lwd=2, legend=c("deamerSE", "true density", 
       "kernel density\nof noisy obs.")) 




