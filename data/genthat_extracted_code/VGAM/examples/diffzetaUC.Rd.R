library(VGAM)


### Name: Diffzeta
### Title: Differenced Zeta Distribution
### Aliases: Diffzeta ddiffzeta pdiffzeta qdiffzeta rdiffzeta
### Keywords: distribution

### ** Examples

ddiffzeta(1:20, 0.5, start = 2)
rdiffzeta(20, 0.5)

## Not run: 
##D  shape <- 0.8; x <- 1:10
##D plot(x, ddiffzeta(x, shape = shape), type = "h", ylim = 0:1,
##D      sub = "shape=0.8", las = 1, col = "blue", ylab = "Probability",
##D      main = "Differenced zeta distribution: blue=PMF; orange=CDF")
##D lines(x + 0.1, pdiffzeta(x, shape = shape), col = "orange", lty = 3, type = "h") 
## End(Not run)



