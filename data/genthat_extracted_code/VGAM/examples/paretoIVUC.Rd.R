library(VGAM)


### Name: ParetoIV
### Title: The Pareto(IV/III/II) Distributions
### Aliases: ParetoIV dparetoIV pparetoIV qparetoIV rparetoIV ParetoIII
###   dparetoIII pparetoIII qparetoIII rparetoIII ParetoII dparetoII
###   pparetoII qparetoII rparetoII ParetoI dparetoI pparetoI qparetoI
###   rparetoI
### Keywords: distribution

### ** Examples

## Not run: 
##D x <- seq(-0.2, 4, by = 0.01)
##D loc <- 0; Scale <- 1; ineq <- 1; shape <- 1.0
##D plot(x, dparetoIV(x, loc, Scale, ineq, shape), type = "l", col = "blue",
##D      main = "Blue is density, orange is cumulative distribution function",
##D      sub = "Purple are 5,10,...,95 percentiles", ylim = 0:1, las = 1, ylab = "")
##D abline(h = 0, col = "blue", lty = 2)
##D Q <- qparetoIV(seq(0.05, 0.95,by = 0.05), loc, Scale, ineq, shape)
##D lines(Q, dparetoIV(Q, loc, Scale, ineq, shape), col = "purple", lty = 3, type = "h")
##D lines(x, pparetoIV(x, loc, Scale, ineq, shape), col = "orange")
##D abline(h = 0, lty = 2)
## End(Not run)



