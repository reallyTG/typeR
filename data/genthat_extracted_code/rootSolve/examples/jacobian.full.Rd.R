library(rootSolve)


### Name: jacobian.full
### Title: Full square jacobian matrix for a system of ODEs (ordinary
###   differential equations)
### Aliases: jacobian.full
### Keywords: math

### ** Examples

## =======================================================================
## 1. Structure of the Jacobian
## =======================================================================
mod <- function (t = 0, y, parms = NULL,...)
{
 dy1<-  y[1] + 2*y[2]
 dy2<-3*y[1] + 4*y[2] + 5*y[3]
 dy3<-         6*y[2] + 7*y[3] + 8*y[4]
 dy4<-                  9*y[3] +10*y[4]
 return(as.list(c(dy1, dy2, dy3, dy4)))
}

jacobian.full(y = c(1, 2, 3, 4), func = mod)

## =======================================================================
## 2. Stability properties of a physical model
## =======================================================================
coriolis <- function (t, velocity, pars, f)
{
  dvelx <- f*velocity[2]
  dvely <- -f*velocity[1]
  list(c(dvelx, dvely))
}

# neutral stability; f is coriolis parameter
Jac <- jacobian.full(y = c(velx = 0, vely = 0), func = coriolis,
                     parms = NULL, f = 1e-4)
print(Jac)
eigen(Jac)$values

## =======================================================================
## 3. Type of equilibrium
## =======================================================================
## From Soetaert and Herman (2009). A practical guide to ecological 
## modelling. Using R as a simulation platform. Springer

eqn <- function (t, state, pars)
 {
  with (as.list(c(state, pars)),  {
  dx <- a*x + cc*y
  dy <- b*y + dd*x
  list(c(dx, dy))
  })
 }

# stable equilibrium
A <- eigen(jacobian.full(y = c(x = 0, y = 0), func = eqn,
              parms = c(a = -0.1, b = -0.3, cc = 0, dd = 0)))$values
# unstable equilibrium
B <- eigen(jacobian.full(y = c(x = 0, y = 0), func = eqn,
              parms = c(a = 0.2, b = 0.2, cc = 0.0, dd = 0.2)))$values
# saddle point
C <- eigen(jacobian.full(y = c(x = 0, y = 0), func = eqn,
              parms = c(a = -0.1, b = 0.1, cc = 0, dd = 0)))$values
# neutral stability
D <- eigen(jacobian.full(y = c(x = 0, y = 0), func = eqn,
              parms = c(a = 0, b = 0, cc = -0.1, dd = 0.1)))$values
# stable focal point
E <- eigen(jacobian.full(y = c(x = 0, y = 0), func = eqn,
              parms = c(a = 0, b = -0.1, cc = -0.1, dd = 0.1)))$values
# unstable focal point
F <- eigen(jacobian.full(y = c(x = 0, y = 0), func=eqn,
              parms = c(a = 0., b = 0.1, cc = 0.1, dd = -0.1)))$values

data.frame(type = c("stable", "unstable", "saddle", "neutral",
           "stable focus", "unstable focus"),
           eigenvalue_1 = c(A[1], B[1], C[1], D[1], E[1], F[1]),
           eigenvalue_2 = c(A[2], B[2], C[2], D[2], E[2], F[2]))

## =======================================================================
## 4. Limit cycles
## =======================================================================
## From Soetaert and Herman (2009). A practical guide to ecological 
## modelling. Using R as a simulation platform. Springer

eqn2 <- function (t, state, pars)
 {
  with (as.list(c(state, pars)),
  {
  dx<-  a*y   + e*x*(x^2+y^2-1)
  dy<-  b*x   + f*y*(x^2+y^2-1)
  list(c(dx, dy))
  })
 }

# stable limit cycle with unstable focus
eigen(jacobian.full(c(x = 0, y = 0), eqn2,
                    parms = c(a = -1, b = 1, e = -1, f = -1)))$values
# unstable limit cycle with stable focus
eigen(jacobian.full(c(x = 0, y = 0), eqn2,
                    parms = c(a = -1, b = 1, e = 1, f = 1)))$values



