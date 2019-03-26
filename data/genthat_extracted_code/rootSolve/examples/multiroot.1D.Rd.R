library(rootSolve)


### Name: multiroot.1D
### Title: Solves for n roots of n (nonlinear) equations, created by
###   discretizing ordinary differential equations.
### Aliases: multiroot.1D
### Keywords: optimize

### ** Examples

## =======================================================================
## Example 1: simple standard problem
## solve the BVP ODE:
## d2y/dt^2=-3py/(p+t^2)^2
## y(t= -0.1)=-0.1/sqrt(p+0.01)
## y(t=  0.1)= 0.1/sqrt(p+0.01)
## where p = 1e-5
##
## analytical solution y(t) = t/sqrt(p + t^2).
##
## =======================================================================

bvp <- function(y) {
  dy2 <- diff(diff(c(ya, y, yb))/dx)/dx
  return(dy2 + 3*p*y/(p+x^2)^2)
}

dx <- 0.0001
x <- seq(-0.1, 0.1, by = dx)

p  <- 1e-5
ya <- -0.1/sqrt(p+0.01)
yb <-  0.1/sqrt(p+0.01)

print(system.time(
  y <- multiroot.1D(start = runif(length(x)), f = bvp, nspec = 1)
))

plot(x, y$root, ylab = "y", main = "BVP test problem")

# add analytical solution
curve(x/sqrt(p+x*x), add = TRUE, type = "l", col = "red")

## =======================================================================
## Example 2: bvp test problem 28
## solve:
## xi*y'' + y*y' - y=0
## with boundary conditions:
## y0=1
## y1=3/2
## =======================================================================

prob28 <-function(y, xi) {
 dy2 <- diff(diff(c(ya, y, yb))/dx)/dx          # y''
 dy  <- 0.5*(diff(c(ya, y)) +diff(c(y, yb)))/dx # y' - centered differences

 xi*dy2 +dy*y-y
}

ya <- 1
yb <- 3/2
dx <- 0.001
x <- seq(0, 1, by = dx)
N <- length(x)
print(system.time(
  Y1 <- multiroot.1D(f = prob28, start = runif(N), 
                     nspec = 1, xi = 0.1)
))
Y2<- multiroot.1D(f = prob28, start = runif(N), nspec = 1, xi = 0.01)
Y3<- multiroot.1D(f = prob28, start = runif(N), nspec = 1, xi = 0.001)

plot(x, Y3$root, type = "l", col = "green", main = "bvp test problem 28")
lines(x, Y2$root, col = "red")
lines(x, Y1$root, col = "blue")




