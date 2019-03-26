library(pracma)


### Name: barylag
### Title: Barycentric Lagrange Interpolation
### Aliases: barylag
### Keywords: math

### ** Examples

##  Generates an example with plot.
# Input:
#   fun  ---  function that shall be 'approximated'
#   a, b ---  interval [a, b] to be used for the example
#   n    ---  number of supporting nodes
#   m    ---  number of interpolation points
# Output
#   plot of function, interpolation, and nodes
#   return value is NULL (invisible)
## Not run: 
##D barycentricExample <- function(fun, a, b, n, m)
##D {
##D 	xi <- seq(a, b, len=n)
##D 	yi <- fun(xi)
##D 	x  <- seq(a, b, len=m)
##D 
##D 	y <- barylag(xi, yi, x)
##D 	plot(xi, yi, col="red", xlab="x", ylab="y",
##D 		main="Example of barycentric interpolation")
##D 
##D 	lines(x, fun(x), col="yellow", lwd=2)
##D 	lines(x, y, col="darkred")
##D 
##D 	grid()
##D }
##D 
##D barycentricExample(sin, -pi, pi, 11, 101)  # good interpolation
##D barycentricExample(runge, -1, 1, 21, 101)  # bad interpolation
## End(Not run)



