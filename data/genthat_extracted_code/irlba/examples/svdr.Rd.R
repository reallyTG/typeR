library(irlba)


### Name: svdr
### Title: Find a few approximate largest singular values and corresponding
###   singular vectors of a matrix.
### Aliases: svdr

### ** Examples

set.seed(1)

A <- matrix(runif(400), nrow=20)
svdr(A, 3)$d

# Compare with svd
svd(A)$d[1:3]

# Compare with irlba
irlba(A, 3)$d

## Not run: 
##D # A problem with clustered large singular values where svdr out-performs irlba.
##D tprolate <- function(n, w=0.25)
##D {
##D   a <- rep(0, n)
##D   a[1] <- 2 * w
##D   a[2:n] <- sin( 2 * pi * w * (1:(n-1)) ) / ( pi * (1:(n-1)) )
##D   toeplitz(a)
##D }
##D 
##D x <- tprolate(512)
##D set.seed(1)
##D tL <- system.time(L <- irlba(x, 20))
##D tR <- system.time(R <- svdr(x, 20))
##D S <- svd(x)
##D plot(S$d)
##D data.frame(time=c(tL[3], tR[3]),
##D            error=sqrt(c(crossprod(L$d - S$d[1:20]), crossprod(R$d - S$d[1:20]))),
##D            row.names=c("IRLBA", "Randomized SVD"))
##D 
##D # But, here is a similar problem with clustered singular values where svdr
##D # doesn't out-perform irlba as easily...clusters of singular values are,
##D # in general, very hard to deal with!
##D # (This example based on https://github.com/bwlewis/irlba/issues/16.)
##D set.seed(1)
##D s <- svd(matrix(rnorm(200 * 200), 200))
##D x <- s$u %*% (c(exp(-(1:100)^0.3) * 1e-12 + 1, rep(0.5, 100)) * t(s$v))
##D tL <- system.time(L <- irlba(x, 5))
##D tR <- system.time(R <- svdr(x, 5))
##D S <- svd(x)
##D plot(S$d)
##D data.frame(time=c(tL[3], tR[3]),
##D            error=sqrt(c(crossprod(L$d - S$d[1:5]), crossprod(R$d - S$d[1:5]))),
##D            row.names=c("IRLBA", "Randomized SVD"))
## End(Not run)



