library(VGAM)


### Name: Biplackett
### Title: Plackett's Bivariate Copula
### Aliases: Biplackett dbiplackcop pbiplackcop rbiplackcop
### Keywords: distribution

### ** Examples

## Not run: 
##D  N <- 101; oratio <- exp(1)
##D x <- seq(0.0, 1.0, len = N)
##D ox <- expand.grid(x, x)
##D zedd <- dbiplackcop(ox[, 1], ox[, 2], oratio = oratio)
##D contour(x, x, matrix(zedd, N, N), col = "blue")
##D zedd <- pbiplackcop(ox[, 1], ox[, 2], oratio = oratio)
##D contour(x, x, matrix(zedd, N, N), col = "blue")
##D 
##D plot(rr <- rbiplackcop(n = 3000, oratio = oratio))
##D par(mfrow = c(1, 2))
##D hist(rr[, 1])  # Should be uniform
##D hist(rr[, 2])  # Should be uniform
## End(Not run)



