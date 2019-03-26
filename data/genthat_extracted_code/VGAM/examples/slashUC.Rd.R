library(VGAM)


### Name: Slash
### Title: Slash Distribution
### Aliases: Slash dslash pslash rslash
### Keywords: distribution

### ** Examples

## Not run: 
##D curve(dslash, col = "blue", ylab = "f(x)", -5, 5, ylim = c(0, 0.4), las = 1,
##D      main = "Standard slash, normal and Cauchy densities", lwd = 2)
##D curve(dnorm, col = "black", lty = 2, lwd = 2, add = TRUE)
##D curve(dcauchy, col = "orange", lty = 3, lwd = 2, add = TRUE)
##D legend("topleft", c("slash", "normal", "Cauchy"), lty = 1:3,
##D        col = c("blue","black","orange"), lwd = 2)
##D 
##D curve(pslash, col = "blue", -5, 5, ylim = 0:1)
##D pslash(c(-Inf, -20000, 20000, Inf))  # Gives a warning
## End(Not run)



