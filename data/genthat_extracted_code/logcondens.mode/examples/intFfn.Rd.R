library(logcondens.mode)


### Name: intFfn
### Title: Computes the Integral of a log-concave CDF at Arbitrary Real
###   Numbers
### Aliases: intFfn
### Keywords: htest nonparametric

### ** Examples


## estimate gamma density
set.seed(1977)
x <- rgamma(200, 2, 1)
res <- activeSetLogCon.mode(x, mode=1)

##  res$x is not equal to x
myIntF <- intFfn( res$x,  res$phi, res$Fhat, side="left")


s <- seq(min(res$x), max(res$x), by = 10 ^ -3)
D1 <- myIntF(s)




