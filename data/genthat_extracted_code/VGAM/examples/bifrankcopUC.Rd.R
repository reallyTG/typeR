library(VGAM)


### Name: Frank
### Title: Frank's Bivariate Distribution
### Aliases: Frank dbifrankcop pbifrankcop rbifrankcop
### Keywords: distribution

### ** Examples

## Not run: 
##D N <- 100; apar <- exp(2)
##D xx <- seq(-0.30, 1.30, len = N)
##D ox <- expand.grid(xx, xx)
##D zedd <- dbifrankcop(ox[, 1], ox[, 2], apar = apar)
##D contour(xx, xx, matrix(zedd, N, N))
##D zedd <- pbifrankcop(ox[, 1], ox[, 2], apar = apar)
##D contour(xx, xx, matrix(zedd, N, N))
##D 
##D plot(rr <- rbifrankcop(n = 3000, apar = exp(4)))
##D par(mfrow = c(1, 2))
##D hist(rr[, 1]); hist(rr[, 2])  # Should be uniform
## End(Not run)



