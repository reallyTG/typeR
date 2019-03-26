library(pdSpecEst)


### Name: pdRankTests
### Title: Rank-based hypothesis tests for HPD matrices
### Aliases: pdRankTests

### ** Examples

## null hypothesis is true
data <- replicate(100, Expm(diag(2), H.coeff(rnorm(4), inverse = TRUE)))
pdRankTests(data, sample_sizes = c(50, 50), test = "rank.sum") ## homogeneity 2 samples
pdRankTests(data, sample_sizes = rep(25, 4), test = "krusk.wall") ## homogeneity 4 samples
pdRankTests(data, test = "bartels") ## randomness

## null hypothesis is false
data1 <- array(c(data, replicate(50, Expm(diag(2), H.coeff(0.5 * rnorm(4), inverse = TRUE)))),
                 dim = c(2,2,150))
pdRankTests(data1, sample_sizes = c(100, 50), test = "rank.sum")
pdRankTests(data1, sample_sizes = rep(50, 3), test = "krusk.wall")
pdRankTests(data1, test = "bartels")

## Not run: 
##D ## signed-rank test for equivalence of spectra of multivariate time series
##D ## ARMA(1,1) process: Example 11.4.1 in (Brockwell and Davis, 1991)
##D Phi <- array(c(0.7, 0, 0, 0.6, rep(0, 4)), dim = c(2, 2, 2))
##D Theta <- array(c(0.5, -0.7, 0.6, 0.8, rep(0, 4)), dim = c(2, 2, 2))
##D Sigma <- matrix(c(1, 0.71, 0.71, 2), nrow = 2)
##D pgram <- function(Sigma) pdPgram(rARMA(2^8, 2, Phi, Theta, Sigma)$X)$P
##D 
##D ## null is true
##D pdRankTests(array(c(pgram(Sigma), pgram(Sigma)), dim = c(2,2,2^8)), test = "signed.rank")
##D ## null is false
##D pdRankTests(array(c(pgram(Sigma), pgram(0.5 * Sigma)), dim = c(2,2,2^8)), test = "signed.rank")
## End(Not run)



