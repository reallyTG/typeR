library(distr)


### Name: RtoDPQ.d
### Title: Default procedure to fill slots d,p,q given r for discrete
###   distributions
### Aliases: RtoDPQ.d
### Keywords: math distribution arith

### ** Examples

rn2 <- function(n){rnorm(n)^2}
x <- RtoDPQ(r = rn2, e = 4, n = 512)
# returns density, cumulative distribution and quantile function of
# squared standard  normal distribution

x$dfun(4)
RtoDPQ(r = rn2, e = 5, n = 1024) # for a better result

rp2 <- function(n){rpois(n, lambda = 1)^2}
x <- RtoDPQ.d(r = rp2, e = 5)
# returns density, cumulative distribution and quantile function of
# squared Poisson distribution with parameter lambda=1



