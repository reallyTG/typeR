library(DescTools)


### Name: UnirootAll
### Title: Finds many (all) roots of one equation within an interval
### Aliases: UnirootAll
### Keywords: optimize

### ** Examples

## =======================================================================
##   Mathematical examples
## =======================================================================

# a well-behaved case...
fun <- function (x) cos(2*x)^3

curve(fun(x), 0, 10,main = "UnirootAll")

All <- UnirootAll(fun, c(0, 10))
points(All, y = rep(0, length(All)), pch = 16, cex = 2)

# a difficult case...
f <- function (x) 1/cos(1+x^2)
AA <- UnirootAll(f, c(-5, 5))
curve(f(x), -5, 5, n = 500, main = "UnirootAll")
points(AA, rep(0, length(AA)), col = "red", pch = 16)

f(AA)  # !!!


## =======================================================================
## Vectorisation:
## =======================================================================
# from R-help Digest, Vol 130, Issue 27
#https://stat.ethz.ch/pipermail/r-help/2013-December/364799.html

integrand1 <- function(x) 1/x*dnorm(x)
integrand2 <- function(x) 1/(2*x-50)*dnorm(x)
integrand3 <- function(x, C) 1/(x+C)

res <- function(C) {
  integrate(integrand1, lower = 1, upper = 50)$value +
  integrate(integrand2, lower = 50, upper = 100)$value -
  integrate(integrand3, C = C, lower = 1, upper = 100)$value
}

# uniroot passes one value at a time to the function, so res can be used as such
uniroot(res, c(1, 1000))

# Need to vectorise the function to use UnirootAll:
res <- Vectorize(res)
UnirootAll(res, c(1,1000))




