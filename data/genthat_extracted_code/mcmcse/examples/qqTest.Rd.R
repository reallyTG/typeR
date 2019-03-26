library(mcmcse)


### Name: qqTest
### Title: QQplot for Markov chains
### Aliases: qqTest

### ** Examples

library(mAr)
p <- 35
n <- 1e4
omega <- 5*diag(1,p)

## Making correlation matrix var(1) model
set.seed(100)
foo <- matrix(rnorm(p^2), nrow = p)
foo <- foo %*% t(foo)
phi <- foo / (max(eigen(foo)$values) + 1)
  
out <- as.matrix(mAr.sim(rep(0,p), phi, omega, N = n))

mcse.bm <- mcse.multi(x = out)
qqTest(mcse.bm)

mcse.isadj <- mcse.initseq(x = out, adjust = TRUE)
qqTest(mcse.isadj)



