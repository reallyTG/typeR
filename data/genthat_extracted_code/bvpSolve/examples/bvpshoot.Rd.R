library(bvpSolve)


### Name: bvpshoot
### Title: Solver for two-point boundary value problems of ordinary
###   differential equations, using the single shooting method
### Aliases: bvpshoot
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
fun <- function(t, y, pars)
{ dy1 <- y[2]
  dy2 <- - 3*p*y[1] / (p+t*t)^2
  return(list(c(dy1,
               dy2))) }


# parameter value
p    <- 1e-5

# initial and final condition; second conditions unknown
init <- c(y = -0.1 / sqrt(p+0.01), dy = NA)
end  <- c(     0.1 / sqrt(p+0.01), NA)

# Solve bvp
sol  <- bvpshoot(yini = init, x = seq(-0.1, 0.1, by = 0.001),
          func = fun, yend = end, guess = 1)
          
plot(sol, which = "y", type = "l")

# add analytical solution
curve(x/sqrt(p+x*x), add = TRUE, type = "p")

## =============================================================================
## Example 1b: simple
## solve d2y/dx2 + 1/x*dy/dx + (1-1/(4x^2)y = sqrt(x)*cos(x),
## on the interval [1,6] and with boundary conditions:
## y(1)=1, y(6)=-0.5
##
## Write as set of 2 odes
## dy/dx = y2
## dy2/dx  = - 1/x*dy/dx - (1-1/(4x^2)y + sqrt(x)*cos(x)
## =============================================================================

f2 <- function(x, y, parms)
{
 dy  <- y[2]
 dy2 <- -1/x*y[2] - (1-1/(4*x^2))*y[1] + sqrt(x)*cos(x)
 list(c(dy, dy2))
}

x    <- seq(1, 6, 0.1)
sol  <- bvpshoot(yini = c(y = 1, dy = NA), yend = c(-0.5, NA), 
          x = x, func = f2, guess = 1)

# plot both state variables
plot(sol, type = "l", lwd = 2)

# plot only y and add the analytic solution
plot(sol, which = "y")

curve(0.0588713*cos(x)/sqrt(x)+1/4*sqrt(x)*cos(x)+0.740071*sin(x)/sqrt(x)+
      1/4*x^(3/2)*sin(x), add = TRUE, type = "l")


## =============================================================================
## Example 2 - initial condition is a function of the unknown x
## tubular reactor with axial dispersion
## y''=Pe(y'+Ry^n) Pe=1,R=2,n=2
## on the interval [0,1] and with initial conditions:
## y'0=Pe(y(0)-1), y'(1)=0
##
## dy=y2
## dy2=Pe(dy-Ry^n)
## =============================================================================

Reactor<-function(x, y, parms)
{
  list(c(y[2],
         Pe * (y[2]+R*(y[1]^n))))
}

Pe <- 1
R  <- 2
n  <- 2
x  <- seq(0, 1, by = 0.01)

# 1. yini is a function here
yini <- function (x, parms) c(x, Pe*(x-1))

system.time(
  sol <- bvpshoot(func = Reactor, yend = c(y = NA, dy = 0), 
          yini = yini, x = x, extra = 1)
)
plot(sol, which = "y", main = "Reactor", type = "l", lwd = 2)
attributes(sol)$roots

# 2. using boundary function rather than yini...
bound <- function(i, y, p) {
  if (i == 1) return(y[2] - Pe*(y[1]-1))
  if (i == 2) return(y[2])
}

# need to give number of left boundary conditions + guess of all initial 
# conditions (+ names)
system.time(
Sol2<- bvpshoot(func = Reactor, x = x, leftbc = 1,
            bound = bound, guess = c(y = 1, dy = 1) )
)
attributes(Sol2)$roots


# 3. boundary function with jacobian of boundary function
jacbound <- function(i, y, p) {
  if (i == 1) return(c(-Pe*y[1], 1))
  if (i == 2) return(c(0, 1))
}
system.time(
Sol3<-bvpshoot(func = Reactor, x = x, leftbc = 1, bound = bound, 
           jacbound = jacbound, guess = c(y = 1, dy = 1) )
)
attributes(Sol3)$roots

## =============================================================================
## Example 2b - same as 2 but written as higher-order equation
## y''=Pe(y'+Ry^n) Pe=1,R=2,n=2
## on the interval [0,1] and with initial conditions:
## y'0=Pe(y(0)-1), y'(1)=0
## =============================================================================

Reactor2<-function(x, y, parms) 
  list (Pe * (y[2]+R*(y[1]^n)))

Pe <- 1
R  <- 2
n  <- 2
x  <- seq(0, 1, by = 0.01)

# 1. yini is a function here
yini <- function (x, parms) c(x, Pe*(x-1))

# need to specify that order = 2
system.time(
  sol2 <- bvpshoot(func = Reactor2, yend = c(y = NA, dy = 0), order=2,
          yini = yini, x = x, extra = 1)
)
max(abs(sol2-sol))

## =============================================================================
## Example 3 - final condition is a residual function
## The example MUSN from Ascher et al., 1995.
## Numerical Solution of Boundary Value Problems for Ordinary Differential
## Equations, SIAM, Philadelphia, PA, 1995.
##
## The problem is
##      u' =  0.5*u*(w - u)/v
##      v' = -0.5*(w - u)
##      w' = (0.9 - 1000*(w - y) - 0.5*w*(w - u))/z
##      z' =  0.5*(w - u)
##      y' = -100*(y - w)
##   on the interval [0 1] and with boundary conditions:
##      u(0) = v(0) = w(0) = 1,  z(0) = -10,  w(1) = y(1)
## =============================================================================

musn <- function(t, Y, pars)
{
  with (as.list(Y),
  {
   du <- 0.5 * u * (w-u)/v
   dv <- -0.5 * (w-u)
   dw <- (0.9 - 1000 * (w-y) - 0.5 * w * (w-u))/z
   dz <- 0.5 * (w-u)
   dy <- -100 * (y-w)
   return(list(c(du, dv, dw, dy, dz)))
  })
}

#--------------------------------
# Residuals of end conditions
#--------------------------------
res  <- function (Y, yini, pars)  with (as.list(Y), w-y)

#--------------------------------
# Initial values; y= NA= not available
#--------------------------------

init <- c(u = 1, v = 1, w = 1, y = NA, z = -10)
sol  <-bvpshoot(y = init, x = seq(0, 1, by = 0.05), func = musn,
           yend = res, guess = 1, atol = 1e-10, rtol = 0)
pairs(sol, main = "MUSN")

## =============================================================================
## Example 4 - solve also for unknown parameter
## Find the 4th eigenvalue of Mathieu's equation:
## y''+(lam-10cos2t)y=0   on the interval [0,pi]
## y(0)=1, y'(0)=0  and y'(pi)=0
## The 2nd order problem is rewritten as 2 first-order problems:
## dy=y2
## dy2= -(lam-10cos(2t))*y
## =============================================================================

mathieu<- function(t, y, lam)
{
 list(c(y[2], -(lam - 10 * cos(2*t)) * y[1]))
}

yini <- c(1, 0)   # initial condition(y1=1,dy=y2=0)
yend <- c(NA, 0)  # final condition at pi (y1=NA, dy=0)

# there is one extra parameter to be fitted: "lam"; its initial guess = 15
Sol  <- bvpshoot(yini = yini, yend = yend, x = seq(0, pi, by = 0.01),
          func = mathieu, guess = NULL, extra = 15)
plot(Sol)
attr(Sol, "roots")  # root gives the value of "lam" (17.1068)



