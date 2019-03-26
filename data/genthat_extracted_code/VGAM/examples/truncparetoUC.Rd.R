library(VGAM)


### Name: Truncpareto
### Title: The Truncated Pareto Distribution
### Aliases: Truncpareto dtruncpareto ptruncpareto qtruncpareto
###   rtruncpareto
### Keywords: distribution

### ** Examples
 lower <- 3; upper <- 8; kay <- exp(0.5)
## Not run: 
##D  xx <- seq(lower - 0.5, upper + 0.5, len = 401)
##D plot(xx, dtruncpareto(xx, low = lower, upp = upper, shape = kay),
##D      main = "Truncated Pareto density split into 10 equal areas",
##D      type = "l", ylim = 0:1, xlab = "x")
##D abline(h = 0, col = "blue", lty = 2)
##D qq <- qtruncpareto(seq(0.1, 0.9, by = 0.1), low = lower, upp = upper,
##D                    shape = kay)
##D lines(qq, dtruncpareto(qq, low = lower, upp = upper, shape = kay),
##D       col = "purple", lty = 3, type = "h")
##D lines(xx, ptruncpareto(xx, low = lower, upp = upper, shape = kay),
##D       col = "orange") 
## End(Not run)
pp <- seq(0.1, 0.9, by = 0.1)
qq <- qtruncpareto(pp, lower = lower, upper = upper, shape = kay)

ptruncpareto(qq, lower = lower, upper = upper, shape = kay)
qtruncpareto(ptruncpareto(qq, lower = lower, upper = upper, shape = kay),
         lower = lower, upper = upper, shape = kay) - qq  # Should be all 0



