library(VGAM)


### Name: Binorm
### Title: Bivariate Normal Distribution Cumulative Distribution Function
### Aliases: Binorm pnorm2 dbinorm pbinorm rbinorm
### Keywords: distribution

### ** Examples

yvec <- c(-5, -1.96, 0, 1.96, 5)
ymat <- expand.grid(yvec, yvec)
cbind(ymat, pbinorm(ymat[, 1], ymat[, 2]))

## Not run: 
##D  rhovec <- seq(-0.95, 0.95, by = 0.01)
##D plot(rhovec, pbinorm(0, 0, cov12 = rhovec), type = "l", col = "blue", las = 1)
##D abline(v = 0, h = 0.25, col = "gray", lty = "dashed") 
## End(Not run)



