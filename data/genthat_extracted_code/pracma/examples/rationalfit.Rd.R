library(pracma)


### Name: rationalfit
### Title: Rational Function Approximation
### Aliases: rationalfit
### Keywords: fitting

### ** Examples

## Not run: 
##D x <- linspace(0, 15, 151); y <- sin(x)/x
##D rA <- rationalfit(x, y, 10, 10); p1 <- rA$p1; p2 <- rA$p2
##D ys <- polyval(p1,x) / polyval(p2,x)
##D plot(x, y, type="l", col="blue", ylim=c(-0.5, 1.0))
##D points(x, Re(ys), col="red")  # max(abs(y-ys), na.rm=TRUE) < 1e-6
##D grid()
##D 
##D # Rational approximation of the Zeta function
##D x <- seq(-5, 5, by = 1/16)
##D y <- zeta(x)
##D rA <- rationalfit(x, y, 10, 10); p1 <- rA$p1; p2 <- rA$p2
##D ys <- polyval(p1,x) / polyval(p2,x)
##D plot(x, y, type="l", col="blue", ylim=c(-5, 5))
##D points(x, Re(ys), col="red")
##D grid()
##D 
##D # Rational approximation to the Gamma function
##D x <- seq(-5, 5, by = 1/32); y <- gamma(x)
##D rA <- rationalfit(x, y, 10, 10); p1 <- rA$p1; p2 <- rA$p2
##D ys <- polyval(p1,x) / polyval(p2,x)
##D plot(x, y, type="l", col = "blue")
##D points(x, Re(ys), col="red")
##D grid()
## End(Not run)



