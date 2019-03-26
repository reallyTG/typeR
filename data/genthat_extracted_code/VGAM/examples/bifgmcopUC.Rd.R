library(VGAM)


### Name: Bifgmcop
### Title: Farlie-Gumbel-Morgenstern's Bivariate Distribution
### Aliases: Bifgmcop dbifgmcop pbifgmcop rbifgmcop
### Keywords: distribution

### ** Examples

## Not run: 
##D  N <- 101; x <- seq(0.0, 1.0, len = N); apar <- 0.7
##D ox <- expand.grid(x, x)
##D zedd <- dbifgmcop(ox[, 1], ox[, 2], apar = apar)
##D contour(x, x, matrix(zedd, N, N), col = "blue")
##D zedd <- pbifgmcop(ox[, 1], ox[, 2], apar = apar)
##D contour(x, x, matrix(zedd, N, N), col = "blue")
##D 
##D plot(r <- rbifgmcop(n = 3000, apar = apar), col = "blue")
##D par(mfrow = c(1, 2))
##D hist(r[, 1])  # Should be uniform
##D hist(r[, 2])  # Should be uniform
## End(Not run)



