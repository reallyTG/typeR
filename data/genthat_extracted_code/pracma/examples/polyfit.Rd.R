library(pracma)


### Name: polyfit,polyfix
### Title: Fitting by Polynomial
### Aliases: polyfit polyfix
### Keywords: math

### ** Examples

  # Fitting the sine function by a polynomial
  x <- seq(0, pi, length.out=25)
  y <- sin(x)
  p <- polyfit(x, y, 6)
  
## Not run: 
##D   # Plot sin and fitted polynomial
##D   plot(x, y, type="b")
##D   yf <- polyval(p, x)
##D   lines(x, yf, col="red")
##D   grid()
## End(Not run)

## Not run: 
##D   n <- 3
##D   N <- 100
##D   x <- linspace(0, 2*pi, N); y = sin(x) + 0.1*rnorm(N)
##D   xfix <- c(0, 2*pi); yfix = c(0, 0)
##D 
##D   xs <- linspace(0, 2*pi); ys <- sin(xs)
##D   plot(xs, ys, type = 'l', col = "gray",
##D 	   main = "Polynom Approximation of Degree 3")
##D   grid()
##D   points(x, y, pch='o', cex=0.5)
##D   points(xfix, yfix, col = "darkred")
##D 
##D   p0 <- polyfit(x, y, n)
##D   lines(xs, polyval(p0, xs), col = "blue")
##D 
##D   p1 <- polyfix(x, y, n, xfix, yfix)
##D   lines(xs, polyval(p1, xs), col = "red")
##D 
##D   legend(4, 1, c("sin", "polyfit", "polyfix"),
##D          col=c("gray", "blue", "red"), lty=c(1,1,1))
## End(Not run)



