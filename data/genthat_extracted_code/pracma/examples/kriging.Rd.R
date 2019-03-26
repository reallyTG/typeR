library(pracma)


### Name: kriging
### Title: Interpolation by Kriging
### Aliases: kriging
### Keywords: fitting

### ** Examples

##  Interpolate the Saddle Point function
f <- function(x) x[1]^2 - x[2]^2       # saddle point function

set.seed(8237)
n <- 36
x <- c(1, 1, -1, -1, runif(n-4, -1, 1)) # add four vertices
y <- c(1, -1, 1, -1, runif(n-4, -1, 1))
u <- cbind(x, y)
v <- numeric(n)
for (i in 1:n) v[i] <- f(c(x[i], y[i]))

kriging(u, v, c(0, 0))                      #=>  0.006177183
kriging(u, v, c(0, 0), type = "simple")     #=>  0.006229557

## Not run: 
##D xs <- linspace(-1, 1, 101)              # interpolation on a diagonal
##D u0 <- cbind(xs, xs)
##D 
##D yo <- kriging(u, v, u0, type = "ordinary")  # ordinary kriging
##D ys <- kriging(u, v, u0, type = "simple")    # simple kriging
##D plot(xs, ys, type = "l", col = "blue", ylim = c(-0.1, 0.1),
##D              main = "Kriging interpolation along the diagonal")
##D lines(xs, yo, col = "red")
##D legend( -1.0, 0.10, c("simple kriging", "ordinary kriging", "function"),
##D         lty = c(1, 1, 1), lwd = c(1, 1, 2), col=c("blue", "red", "black"))
##D grid()
##D lines(c(-1, 1), c(0, 0), lwd = 2)
## End(Not run)

##  Find minimum of the sphere function
f <- function(x, y) x^2 + y^2 + 100
v <- bsxfun(f, x, y)

ff <- function(w) kriging(u, v, w)
ff(c(0, 0))                                 #=>  100.0317
## Not run: 
##D optim(c(0.0, 0.0), ff)
##D # $par:   [1]  0.04490075 0.01970690
##D # $value: [1]  100.0291
##D ezcontour(ff, c(-1, 1), c(-1, 1))
##D points(0.04490075, 0.01970690, col = "red")
## End(Not run)



