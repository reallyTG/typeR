library(bvpSolve)


### Name: bvpcol
### Title: Solves multipoint boundary value problems of ordinary
###   differential equations or differential algebraic equations, using a
###   collocation method.
### Aliases: bvpcol
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
  dy2 <- - 3 * p * y[1] / (p+t*t)^2
  return(list(c(dy1,
                dy2))) }

# parameter value
p    <- 1e-5

# initial and final condition; second conditions unknown
init <- c(-0.1 / sqrt(p+0.01), NA)
end  <- c( 0.1 / sqrt(p+0.01), NA)

# Solve bvp
sol  <- bvpcol(yini = init, yend = end, 
               x = seq(-0.1, 0.1, by = 0.001), func = fun)
plot(sol, which = 1)

# add analytical solution
curve(x/sqrt(p+x*x), add = TRUE, type = "p")

diagnostics(sol)

zoom <- approx(sol, xout = seq(-0.005, 0.005, by  = 0.0001))
plot(zoom, which = 1, main = "zoom in on [-0.0005,0.0005]")


## =============================================================================
## Example 1b: 
## Same problem, now solved as a second-order equation 
## and with different value of "p".
## =============================================================================

fun2 <- function(t, y, pars)
{ dy <- - 3 * p * y[1] / (p+t*t)^2
  list(dy)
}

p <- 1e-4
sol2  <- bvpcol(yini = init, yend = end, order = 2, 
                x = seq(-0.1, 0.1, by = 0.001), func = fun2)

# plot both runs at once:
plot(sol, sol2, which = 1)

## =============================================================================
## Example 1c: simple
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
 dy2 <- -1/x * y[2]- (1-1/(4*x^2))*y[1] + sqrt(x)*cos(x)
 list(c(dy, dy2))
}

x    <- seq(1, 6, 0.1)
sol  <- bvpcol(yini = c(1, NA), yend = c(-0.5, NA), bspline = TRUE,
               x = x, func = f2)
plot(sol, which = 1)

# add the analytic solution
curve(0.0588713*cos(x)/sqrt(x) + 1/4*sqrt(x)*cos(x)+0.740071*sin(x)/sqrt(x)+
      1/4*x^(3/2)*sin(x), add = TRUE, type = "l")


## =============================================================================
## Example 2. Uses continuation
## Test problem 24
## =============================================================================

Prob24<- function(t, y, ks) {     #eps is called ks here
  A <- 1+t*t
  AA <- 2*t
  ga <- 1.4
  list(c(y[2],(((1+ga)/2 -ks*AA)*y[1]*y[2]-y[2]/y[1]-
               (AA/A)*(1-(ga-1)*y[1]^2/2))/(ks*A*y[1])))
}

ini <- c(0.9129, NA)
end <- c(0.375, NA)
xguess <- c(0, 1)
yguess <- matrix(nrow = 2, ncol = 2, 0.9 )

# bvpcol works with eps NOT too small, and good initial condition ...
sol <- bvpcol(yini = ini, yend = end, x = seq(0, 1, by = 0.01),
              xguess = xguess, yguess = yguess,
              parms = 0.1, func = Prob24, verbose = FALSE)

# when continuation is used: does not need a good initial condition
sol2 <- bvpcol(yini = ini, yend = end, x = seq(0, 1, by = 0.01),
                  parms = 0.05, func = Prob24,
                  eps = 0.05)
                  
#zoom <- approx(sol2, xout = seq(0.01, 0.02, by  = 0.0001))
#plot(zoom, which = 1, main = "zoom in on [0.01, 0.02]")

sol3 <- bvpcol(yini = ini, yend = end, x = seq(0, 1, by = 0.01),
                  parms = 0.01, func = Prob24 , eps = 0.01)

sol4 <- bvpcol(yini = ini, yend = end, x = seq(0, 1, by = 0.01),
                  parms = 0.001, func = Prob24, eps = 0.001)

# This takes a long time
## Not run: 
##D print(system.time(
##D sol5 <- bvpcol(yini = ini, yend = end, x = seq(0, 1, by = 0.01),
##D                   parms = 1e-4, func = Prob24, eps = 1e-4)
##D ))
## End(Not run)

plot(sol, sol2, sol3, sol4, which = 1, main = "test problem 24",
     lwd = 2)

legend("topright", col = 1:4, lty = 1:4, lwd = 2,
       legend = c("0.1", "0.05", "0.01", "0.001"), title = "eps")

## =============================================================================
## Example 3  - solved with specification of boundary, and jacobians
## d4y/dx4 =R(dy/dx*d2y/dx2 -y*dy3/dx3)
## y(0)=y'(0)=0
## y(1)=1, y'(1)=0
##
## dy/dx  = y2
## dy2/dx = y3    (=d2y/dx2)
## dy3/dx = y4    (=d3y/dx3)
## dy4/dx = R*(y2*y3 -y*y4)
## =============================================================================

# derivative function: 4 first-order derivatives
f1st<- function(x, y, S) {
  list(c(y[2],
         y[3],
         y[4],
         1/S*(y[2]*y[3] - y[1]*y[4]) ))
}

# jacobian of derivative function
df1st <- function(x, y, S) {
 matrix(nrow = 4, ncol = 4, byrow = TRUE, data = c(
             0,         1,      0,       0,
             0,         0,      1,       0,
             0,         0,      0,       1,
             -1*y[4]/S, y[3]/S, y[2]/S, -y[1]/S))
}

# boundary
g2 <- function(i, y, S)  {
  if (i == 1) return (y[1])
  if (i == 2) return (y[2])
  if (i == 3) return (y[1] - 1)
  if (i == 4) return (y[2])
}

# jacobian of boundary
dg2 <- function(i, y, S)  {
  if (i == 1) return(c(1, 0, 0, 0))
  if (i == 2) return(c(0, 1, 0, 0))
  if (i == 3) return(c(1, 0, 0, 0))
  if (i == 4) return(c(0, 1, 0, 0))
}

# we use posbound to specify the position of boundary conditions
# we can also use leftbc = 2 rather than posbound = c(0,0,1,1)
S    <- 1/100
sol  <- bvpcol(x = seq(0, 1, by = 0.01),
          ynames = c("y", "dy", "d2y", "d3y"),
          posbound = c(0, 0, 1, 1), func = f1st, parms = S, eps = S,
          bound = g2, jacfunc = df1st, jacbound = dg2)

plot(sol)

## =============================================================================
## Example 3b - solved with specification of boundary, and jacobians
## and as a higher-order derivative
## d4y/dx4 =R(dy/dx*d2y/dx2 -y*dy3/dx3)
## y(0)=y'(0)=0
## y(1)=1, y'(1)=0
## =============================================================================

# derivative function: one fourth-order derivative
f4th <- function(x, y, S) {
  list(1/S * (y[2]*y[3] - y[1]*y[4]))
}

# jacobian of derivative function
df4th <- function(x, y, S)  {
  matrix(nrow = 1, ncol = 4, byrow = TRUE, data = c(
             -1*y[4]/S, y[3]/S, y[2]/S, -y[1]/S))
}

# boundary function - same as previous example

# jacobian of boundary - same as previous

# order = 4 specifies the equation to be 4th order
# solve with bspline false
S    <- 1/100
sol  <- bvpcol (x = seq(0, 1, by = 0.01),
          ynames = c("y", "dy", "d2y", "d3y"),
          posbound = c(0, 0, 1, 1), func = f4th, order = 4,
          parms = S, eps = S, bound = g2, jacfunc = df4th,
          jacbound = dg2 )

plot(sol)

# Use (manual) continuation to find solution of a more difficult example
# Previous solution collocation from sol passed ("guess = sol")

sol2  <- bvpcol(x = seq(0, 1, by = 0.01),
          ynames = c("y", "dy", "d2y", "d3y"),
          posbound = c(0, 0, 1, 1), func = f4th,
          parms = 1e-6, order = 4, eps = 1e-6,
          bound = g2, jacfunc = df4th, jacbound = dg2 )

# plot both at same time
plot(sol, sol2, lwd = 2)

legend("bottomright", leg = c(100, 10000), title = "R = ",
         col = 1:2, lty = 1:2, lwd = 2)


## =============================================================================
## Example 4  - a multipoint bvp
## dy1 = (y2 - 1)/2
## dy2 = (y1*y2 - x)/mu
## over interval [0,1]
## y1(1) = 0; y2(0.5) = 1
## =============================================================================

multip <- function (x, y, p) {
  list(c((y[2] - 1)/2, 
         (y[1]*y[2] - x)/mu))
}

bound <- function (i, y, p) {
  if (i == 1) y[2] -1    # at x=0.5: y2=1
  else y[1]              # at x=  1: y1=0
}

mu  <- 0.1
sol <- bvpcol(func = multip, bound = bound, 
              x = seq(0, 1, 0.01), posbound = c(0.5, 1))

plot(sol)

# check boundary value
sol[sol[,1] == 0.5,]


## =============================================================================
## Example 5 - a bvp DAE
## =============================================================================

bvpdae <- function(t, x, ks, ...) {
  p1  <- p2 <- sin(t)
  dp1 <- dp2 <- cos(t)
  
  dx1 <- (ks + x[2] - p2)*x[4] + dp1
  dx2 <- dp2
  dx3 <- x[4]
  res <- (x[1] - p1)*(x[4] - exp(t))

  list(c(dx1, dx2, dx3, res), res = res)
}

boundfun <- function(i,  x, par, ...) {
  if (i == 1) return(x[1] - sin(0))
  if (i == 2) return(x[3] - 1)
  if (i == 3) return(x[2] - sin(1))
  if (i == 4) return((x[1] - sin(1))*(x[4] - exp(1)))  # Not used here..
}

x <- seq(0, 1, by = 0.01)
mass <- diag(nrow = 4)  ; mass[4, 4] <- 0

# solved using boundfun
out <- bvpcol (func = bvpdae, bound = boundfun, x = x, 
               parms = 1e-4, ncomp = 4, leftbc = 2,
               dae = list(index = 2,  nalg = 1)) 

# solved using yini, yend
out1 <- bvpcol (func = bvpdae, x = x, parms = 1e-4, 
                yini = c(sin(0), NA, 1, NA), 
                yend = c(NA, sin(1), NA, NA),
                dae = list(index = 2,  nalg = 1)) 

# the analytic solution
ana <- cbind(x, "1" = sin(x), "2" = sin(x), "3" = 1, "4" = 0, res = 0)
plot(out, out1, obs = ana)




