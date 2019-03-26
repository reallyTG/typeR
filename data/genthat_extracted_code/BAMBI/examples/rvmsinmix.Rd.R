library(BAMBI)


### Name: rvmsinmix
### Title: The bivariate von Mises sine model mixtures
### Aliases: rvmsinmix dvmsinmix

### ** Examples

kappa1 <- c(1, 2, 3)
kappa2 <- c(1, 6, 5)
kappa3 <- c(0, 1, 2)
mu1 <- c(1, 2, 5)
mu2 <- c(0, 1, 3)
pmix <- c(0.3, 0.4, 0.3)
x <- diag(2, 2)
n <- 10

# mixture densities calculated at the rows of x
dvmsinmix(x, kappa1, kappa2, kappa3, mu1, mu2, pmix)

# number of observations generated from the mixture distribution is n
rvmsinmix(n, kappa1, kappa2, kappa3, mu1, mu2, pmix)




