library(pracma)


### Name: Si, Ci
### Title: Sine and Cosine Integral Functions
### Aliases: Si Ci
### Keywords: specfun

### ** Examples

x <- c(-3:3) * pi
Si(x); Ci(x)

## Not run: 
##D xs <- linspace(0, 10*pi, 200)
##D ysi <- Si(xs); yci <- Ci(xs)
##D plot(c(0, 35), c(-1.5, 2.0), type = 'n', xlab = '', ylab = '',
##D      main = "Sine and cosine integral functions")
##D lines(xs, ysi, col = "darkred",  lwd = 2)
##D lines(xs, yci, col = "darkblue", lwd = 2)
##D lines(c(0, 10*pi), c(pi/2, pi/2), col = "gray")
##D lines(xs, cos(xs), col = "gray")
##D grid()
## End(Not run)



