library(rstpm2)


### Name: vuniroot
### Title: Vectorised One Dimensional Root (Zero) Finding
### Aliases: vuniroot
### Keywords: optimize

### ** Examples
## No test: 
require(utils) # for str

## some platforms hit zero exactly on the first step:
## if so the estimated precision is 2/3.
f <- function (x, a) x - a
str(xmin <- vuniroot(f, lower=c(0, 0), upper=c(1,1), tol = 0.0001, a = c(1/3,2/3)))

## handheld calculator example: fixed point of cos(.):
vuniroot(function(x) cos(x) - x, lower = -pi, upper = pi, tol = 1e-9)$root
## End(No test)




