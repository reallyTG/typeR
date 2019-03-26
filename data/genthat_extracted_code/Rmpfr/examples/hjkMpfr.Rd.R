library(Rmpfr)


### Name: hjkMpfr
### Title: Hooke-Jeeves Derivative-Free Minimization R (working for MPFR)
### Aliases: hjkMpfr
### Keywords: optimize

### ** Examples

## simple smooth example:
ff <- function(x) sum((x - c(2:4))^2)
str(rr <- hjkMpfr(rep(mpfr(0,128), 3), ff, control=list(info=TRUE)))


## Hooke-Jeeves solves high-dim. Rosenbrock function  {but slowly!}
rosenbrock <- function(x) {
    n <- length(x)
    sum (100*((x1 <- x[1:(n-1)])^2 - x[2:n])^2 + (x1 - 1)^2)
}

par0 <- rep(0, 10)
str(rb.db <- hjkMpfr(rep(0, 10), rosenbrock, control=list(info=TRUE)))
## No test: 
## rosenbrook() is quite slow with mpfr-numbers:
str(rb.M. <- hjkMpfr(mpfr(numeric(10), prec=128), rosenbrock,
                     control = list(tol = 1e-8, info=TRUE)))
## End(No test)


##  Hooke-Jeeves does not work well on non-smooth functions
nsf <- function(x) {
  f1 <- x[1]^2 + x[2]^2
  f2 <- x[1]^2 + x[2]^2 + 10 * (-4*x[1] - x[2] + 4)
  f3 <- x[1]^2 + x[2]^2 + 10 * (-x[1] - 2*x[2] + 6)
  max(f1, f2, f3)
}
par0 <- c(1, 1) # true min 7.2 at (1.2, 2.4)
h.d <- hjkMpfr(par0,            nsf) # fmin=8 at xmin=(2,2)
## No test: 
## and this is not at all better (but slower!)
h.M <- hjkMpfr(mpfr(c(1,1), 128), nsf, control = list(tol = 1e-15))
## End(No test)
## --> demo(hjkMpfr) # -> Fletcher's chebyquad function m = n -- residuals



