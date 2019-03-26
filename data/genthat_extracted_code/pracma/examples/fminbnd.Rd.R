library(pracma)


### Name: fminbnd
### Title: Finding Function Minimum
### Aliases: fminbnd
### Keywords: optimize

### ** Examples

##  CHEBFUN example by Trefethen
f <- function(x) exp(x)*sin(3*x)*tanh(5*cos(30*x))
fminbnd(f, -1, 1)                   # fourth local minimum (from left)
g <- function(x) complexstep(f, x)  # complex-step derivative
xs <- findzeros(g, -1, 1)           # local minima and maxima
ys <- f(xs); n0 <- which.min(ys)    # index of global minimum
fminbnd(f, xs[n0-1], xs[n0+1])      # xmin:0.7036632, fmin: -1.727377

## Not run: 
##D ezplot(f, -1, 1, n = 1000, col = "darkblue", lwd = 2)
##D ezplot(function(x) g(x)/150, -1, 1, n = 1000, col = "darkred", add = TRUE)
##D grid()
## End(Not run)



