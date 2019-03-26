library(gmm)


### Name: KTest
### Title: Compute the K statistics of Kleibergen
### Aliases: KTest print.gmmTests

### ** Examples


library(mvtnorm)
sig <- matrix(c(1,.5,.5,1),2,2)
n <- 400
e <- rmvnorm(n,sigma=sig)
x4 <- rnorm(n)
w <- exp(-x4^2) + e[,1]
y <- 0.1*w + e[,2]
h <- cbind(x4, x4^2, x4^3, x4^6)
g3 <- y~w
res <- gmm(g3,h)

# Testing the whole vector:

KTest(res,theta0=c(0,.1))

# Testing a subset of the vector (See \code{gmm})

res2 <- gmm(g3, h, eqConst=matrix(c(2,.1),1,2))
res2
KTest(res2)




