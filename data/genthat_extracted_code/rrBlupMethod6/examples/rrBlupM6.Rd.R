library(rrBlupMethod6)


### Name: rrBlupM6
### Title: rrBlupM6 - RR-BLUP for estimation of marker effects with fixed
###   residual variance
### Aliases: rrBlupM6

### ** Examples


## simulate a small data set (250 observations, 300 markers)
set.seed(3421475)
N <- 250
M <- 300

Z <- matrix(sample(c(1,-1),N * M, replace = TRUE),
            nrow = N,
            ncol = M)

## marker effects
u <- rnorm(M, 0, sqrt(1/M))

sig2e <- 1
y <- Z %*% u + rnorm(N,0,sqrt(sig2e))

out <- rrBlupM6(Z = Z, y = y, sig2e = sig2e)

## estimated marker effect variance
out$sig2u



## accuracy in validation set
Z.val <- matrix(sample(c(1,-1),N * M, replace = TRUE),
                nrow = N,
                ncol = M)

cor(Z.val%*% out$uhat, Z.val%*% u)

## compute ZZ' in chunks
out.chunks <- rrBlupM6(Z = Z, y = y, sig2e = sig2e, chunks = 6)

cor(Z.val%*% out.chunks$uhat, Z.val%*% u)



