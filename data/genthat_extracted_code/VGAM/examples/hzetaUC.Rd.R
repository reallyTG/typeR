library(VGAM)


### Name: Hzeta
### Title: Haight's Zeta Distribution
### Aliases: Hzeta dhzeta phzeta qhzeta rhzeta
### Keywords: distribution

### ** Examples

dhzeta(1:20, 2.1)
rhzeta(20, 2.1)

round(1000 * dhzeta(1:8, 2))
table(rhzeta(1000, 2))

## Not run: 
##D  shape <- 1.1; x <- 1:10
##D plot(x, dhzeta(x, shape = shape), type = "h", ylim = 0:1, lwd = 2,
##D      sub = paste("shape =", shape), las = 1, col = "blue", ylab = "Probability",
##D      main = "Haight's zeta: blue = density; orange = distribution function")
##D lines(x+0.1, phzeta(x, shape = shape), col = "orange", lty = 3, lwd = 2,
##D       type = "h")
## End(Not run)



