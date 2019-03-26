library(VGAM)


### Name: Biamhcop
### Title: Ali-Mikhail-Haq Bivariate Distribution
### Aliases: Biamhcop dbiamhcop pbiamhcop rbiamhcop
### Keywords: distribution

### ** Examples
 x <- seq(0, 1, len = (N <- 101)); apar <- 0.7
ox <- expand.grid(x, x)
zedd <- dbiamhcop(ox[, 1], ox[, 2], apar = apar)
## Not run: 
##D contour(x, x, matrix(zedd, N, N), col = "blue")
##D zedd <- pbiamhcop(ox[, 1], ox[, 2], apar = apar)
##D contour(x, x, matrix(zedd, N, N), col = "blue")
##D 
##D plot(r <- rbiamhcop(n = 1000, apar = apar), col = "blue")
##D par(mfrow = c(1, 2))
##D hist(r[, 1])  # Should be uniform
##D hist(r[, 2])  # Should be uniform
## End(Not run)



