library(robustbase)


### Name: h.alpha.n
### Title: Compute h, the subsample size for MCD and LTS
### Aliases: h.alpha.n
### Keywords: arith

### ** Examples

n <- c(10:20,50,100)
p <- 5
## show the simple "alpha = 1/2" case:
cbind(n=n, h= h.alpha.n(1/2, n, p), n2p = floor((n+p+1)/2))

## alpha = 3/4 is recommended by some authors :
n <- c(15, 20, 25, 30, 50, 100)
cbind(n=n, h= h.alpha.n(3/4, n, p = 6))



