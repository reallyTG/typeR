library(mcmcse)


### Name: mcse.initseq
### Title: Multivariate Monte Carlo standard errors for expectations with
###   the initial sequence method of Dai and Jones (2017).
### Aliases: mcse.initseq

### ** Examples

library(mAr)
p <- 3
n <- 1000
omega <- 5*diag(1,p)

## Making correlation matrix var(1) model
set.seed(100)
foo <- matrix(rnorm(p^2), nrow = p)
foo <- foo %*% t(foo)
phi <- foo / (max(eigen(foo)$values) + 1)

dat <- as.matrix(mAr.sim(rep(0,p), phi, omega, N = n))

out.mcse <- mcse.initseq(x = dat)
out.mcse.adj  <- mcse.initseq(x = dat,adjust = TRUE)

# If we are only estimating the mean of the first component, 
# and the second moment of the second component
g <- function(x) return(c(x[1], x[2]^2))
out.g.mcse <- mcse.initseq(x = dat, g = g)



