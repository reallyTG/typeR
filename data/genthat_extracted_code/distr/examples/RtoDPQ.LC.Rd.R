library(distr)


### Name: RtoDPQ.LC
### Title: Default procedure to fill slots d,p,q given r for Lebesgue
###   decomposed distributions
### Aliases: RtoDPQ.LC
### Keywords: math distribution arith

### ** Examples

rn2 <- function(n)ifelse(rbinom(n,1,0.3),rnorm(n)^2,rbinom(n,4,.3))
x <- RtoDPQ.LC(r = rn2, e = 4, n = 512)
plot(x)
# returns density, cumulative distribution and quantile function of
# squared standard normal distribution
d.discrete(x)(4)
x2 <- RtoDPQ.LC(r = rn2, e = 5, n = 1024) # for a better result
plot(x2)



