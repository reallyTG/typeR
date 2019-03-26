library(bvpSolve)


### Name: bvptwp
### Title: Solves two-point boundary value problems of ordinary
###   differential equations, using a mono-implicit Runge-Kutta formula
### Aliases: bvptwp
### Keywords: math

### ** Examples

## =============================================================================
## Example 1: simple standard problem
## solve the BVP ODE:
## d2y/dt^2=-3py/(p+t^2)^2
## y(t= -0.1)=-0.1/sqrt(p+0.01)
## y(t=  0.1)= 0.1/sqrt(p+0.01)
## where p = 1e-5
##
## analytical solution y(t) = t/sqrt(p + t^2).
##
## The problem is rewritten as a system of 2 ODEs:
## dy=y2
## dy2=-3p*y/(p+t^2)^2
## =============================================================================

#--------------------------------
# Derivative function
#--------------------------------
fun <- function(t, y, pars) {
  dy1 <- y[2]
  dy2 <- - 3*p*y[1] / (p+t*t)^2
  return(list(c(dy1,
                dy2))) }


# parameter value
p    <- 1e-5

# initial and final condition; second conditions unknown
init <- c(y = -0.1 / sqrt(p+0.01), dy=NA)
end  <- c(     0.1 / sqrt(p+0.01), NA)

# Solve bvp
sol  <- as.data.frame(bvptwp(yini = init, x = seq(-0.1, 0.1, by = 0.001),
        func = fun, yend = end))
plot(sol$x, sol$y, type = "l")

# add analytical solution
curve(x/sqrt(p+x*x), add = TRUE, type = "p")


## =============================================================================
## Example 1b: 
## Same problem, now solved as a second-order equation.
## =============================================================================

fun2 <- function(t, y, pars)  {
  dy <- - 3 * p * y[1] / (p+t*t)^2
  list(dy)
}
sol2  <- bvptwp(yini = init, yend = end, order = 2, 
                x = seq(-0.1, 0.1, by = 0.001), func = fun2)

## =============================================================================
## Example 2: simple
## solve d2y/dx2 + 1/x*dy/dx + (1-1/(4x^2)y = sqrt(x)*cos(x),
## on the interval [1,6] and with boundary conditions:
## y(1)=1, y(6)=-0.5
##
## Write as set of 2 odes
## dy/dx = y2
## dy2/dx  = - 1/x*dy/dx - (1-1/(4x^2)y + sqrt(x)*cos(x)
## =============================================================================

f2 <- function(x, y, parms) {
  dy  <- y[2]
  dy2 <- -1/x*y[2] - (1-1/(4*x^2))*y[1] + sqrt(x)*cos(x)
  list(c(dy, dy2))
}

x    <- seq(1, 6, 0.1)
sol  <- bvptwp(yini = c(y = 1, dy = NA),
               yend = c(-0.5, NA), x = x, func = f2)
plot(sol, which = "y")

# add the analytic solution
curve(0.0588713*cos(x)/sqrt(x)+1/4*sqrt(x)*cos(x)+0.740071*sin(x)/sqrt(x)+
      1/4*x^(3/2)*sin(x), add = TRUE, type = "l")

## =============================================================================
## Example 3  - solved with automatic continuation
## d2y/dx2 = y/xi
## =============================================================================

Prob1 <- function(t, y, xi)
   list(c( y[2] , y[1]/xi ))

x <-  seq(0, 1, by = 0.01)
xi <- 0.1
twp <- bvptwp(yini = c(1, NA), yend = c(0, NA), x = x,
             islin = TRUE, func = Prob1, parms = xi, eps = xi)

xi <-0.00001
twp2 <- bvptwp(yini = c(1, NA), yend = c(0, NA), x = x,
               islin = TRUE, func = Prob1, parms = xi, eps = xi)

plot(twp, twp2, which = 1, main = "test problem 1")

# exact solution
curve(exp(-x/sqrt(xi))-exp((x-2)/sqrt(xi))/(1-exp(-2/sqrt(xi))),
      0, 1, add = TRUE, type = "p")

curve(exp(-x/sqrt(0.1))-exp((x-2)/sqrt(0.1))/(1-exp(-2/sqrt(0.1))),
      0, 1, add = TRUE, type = "p")

## =============================================================================
## Example 4  - solved with specification of boundary, and jacobians
## d4y/dx4 =R(dy/dx*d2y/dx2 -y*dy3/dx3)
## y(0)=y'(0)=0
## y(1)=1, y'(1)=0
##
## dy/dx  = y2
## dy2/dx = y3    (=d2y/dx2)
## dy3/dx = y4    (=d3y/dx3)
## dy4/dx = R*(y2*y3 -y*y4)
## =============================================================================

f2<- function(x, y, parms, R) {
  list(c(y[2], y[3], y[4], R*(y[2]*y[3] - y[1]*y[4]) ))
}

df2 <- function(x, y, parms, R) {
  matrix(nrow = 4, ncol = 4, byrow = TRUE, data = c(
             0,        1,     0,     0,
             0,        0,     1,     0,
             0,        0,     0,     1,
             -1*R*y[4],R*y[3],R*y[2],-R*y[1]))
}

g2 <- function(i, y, parms, R) {
  if (i == 1) return(y[1])
  if (i == 2) return(y[2])
  if (i == 3) return(y[1]-1)
  if (i == 4) return(y[2])
}

dg2 <- function(i, y, parms, R) {
  if (i == 1) return(c(1, 0, 0, 0))
  if (i == 2) return(c(0, 1, 0, 0))
  if (i == 3) return(c(1, 0, 0, 0))
  if (i == 4) return(c(0, 1, 0, 0))
}

init <- c(1, NA)
R    <- 100
sol  <- bvptwp(x = seq(0, 1, by = 0.01), leftbc = 2,
          func = f2, R = R, ncomp = 4,
          bound = g2, jacfunc = df2, jacbound = dg2)
plot(sol[,1:2])  # columns do not have names

mf <- par ("mfrow")
sol  <- bvptwp(x = seq(0, 1, by = 0.01), leftbc = 2,
          func = f2, ynames = c("y", "dy", "d2y", "d3y"), R=R,
          bound = g2, jacfunc = df2, jacbound = dg2)
plot(sol)        # here they do
par(mfrow = mf)

## =============================================================================
## Example 4b - solved with specification of boundary, and jacobians
## and as a higher-order derivative
## d4y/dx4 =R(dy/dx*d2y/dx2 -y*dy3/dx3)
## y(0)=y'(0)=0
## y(1)=1, y'(1)=0
## =============================================================================

# derivative function: one fourth-order derivative
f4th <- function(x, y, parms, R) {
  list(R * (y[2]*y[3] - y[1]*y[4]))
}

# jacobian of derivative function
df4th <- function(x, y, parms, R)  {
 df <- matrix(nrow = 1, ncol = 4, byrow = TRUE, data = c(
             -1*R*y[4], R*y[3], R*y[2], -R*y[1]))
}

# boundary function - same as previous example

# jacobian of boundary - same as previous

# order = 4 specifies the equation to be 4th order
sol2 <- bvptwp(x = seq(0, 1, by = 0.01), 
          ynames = c("y", "dy", "d2y", "d3y"),
          posbound = c(0, 0, 1, 1), func = f4th, R = R, order = 4, 
          bound = g2, jacfunc = df4th, jacbound = dg2)

max(abs(sol2-sol))




