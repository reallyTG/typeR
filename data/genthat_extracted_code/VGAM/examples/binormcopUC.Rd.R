library(VGAM)


### Name: Binormcop
### Title: Gaussian Copula (Bivariate) Distribution
### Aliases: Binormcop dbinormcop pbinormcop rbinormcop
### Keywords: distribution

### ** Examples

## Not run: 
##D  edge <- 0.01  # A small positive value
##D N <- 101; x <- seq(edge, 1.0 - edge, len = N); Rho <- 0.7
##D ox <- expand.grid(x, x)
##D zedd <- dbinormcop(ox[, 1], ox[, 2], rho = Rho, log = TRUE)
##D contour(x, x, matrix(zedd, N, N), col = "blue", labcex = 1.5)
##D zedd <- pbinormcop(ox[, 1], ox[, 2], rho = Rho)
##D contour(x, x, matrix(zedd, N, N), col = "blue", labcex = 1.5)
## End(Not run)



