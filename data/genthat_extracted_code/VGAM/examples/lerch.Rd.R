library(VGAM)


### Name: lerch
### Title: Lerch Phi Function
### Aliases: lerch
### Keywords: math

### ** Examples

## Not run: 
##D s <- 2; v <- 1; x <- seq(-1.1, 1.1, length = 201)
##D plot(x, lerch(x, s = s, v = v), type = "l", col = "blue", las = 1,
##D      main = paste("lerch(x, s = ", s,", v =", v, ")", sep = ""))
##D abline(v = 0, h = 1, lty = "dashed", col = "gray")
##D 
##D s <- rnorm(n = 100)
##D max(abs(zeta(s) - lerch(x = 1, s = s, v = 1)))  # This fails (a bug); should be 0
## End(Not run)



