library(hesim)


### Name: rpwexp
### Title: Random generation for piecewise exponential distribution
### Aliases: rpwexp

### ** Examples

rate <- c(.6, 1.2, 1.3)
n <- 100000
ratemat <- matrix(rep(rate, n/2), nrow = n, 
                  ncol = 3, byrow = TRUE)
t <- c(0, 10, 15) 
ptm <- proc.time()
samp <- rpwexp(n, ratemat, t)
proc.time() - ptm
summary(samp)



