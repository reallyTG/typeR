library(bsplinePsd)


### Name: dbspline
### Title: Generate a B-spline density basis of any degree
### Aliases: dbspline

### ** Examples

## Not run: 
##D 
##D # Generate basis functions
##D set.seed(1)
##D x = seq(0, 1, length = 256)
##D knots = sort(c(0, runif(10), 1))
##D basis = dbspline(x, knots)
##D 
##D # Plot basis functions
##D plot(x, basis[1, ], type = "l", ylim = c(min(basis), max(basis)), 
##D      ylab = expression(b[3](x)), main = "Cubic B-spline Density Basis Functions")
##D for (i in 2:nrow(basis)) lines(x, basis[i, ], col = i)
## End(Not run)



