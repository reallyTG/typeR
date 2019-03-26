library(pracma)


### Name: simpadpt
### Title: Adaptive Simpson Quadrature
### Aliases: simpadpt
### Keywords: math

### ** Examples

myf <- function(x, n) 1/(x+n)  # 0.0953101798043249 , log((n+1)/n) for n=10
simpadpt(myf, 0, 1, n = 10)    # 0.095310179804535

##  Dilogarithm function
flog  <- function(t) log(1-t) / t  # singularity at t=1, almost at t=0
dilog <- function(x) simpadpt(flog, x, 0, tol = 1e-12)
dilog(1)  # 1.64493406685615
          # 1.64493406684823 = pi^2/6

## Not run: 
##D N <- 51
##D xs <- seq(-5, 1, length.out = N)
##D ys <- numeric(N)
##D for (i in 1:N) ys[i] <- dilog(xs[i])
##D plot(xs, ys, type = "l", col = "blue",
##D              main = "Dilogarithm function")
##D grid()
## End(Not run)



