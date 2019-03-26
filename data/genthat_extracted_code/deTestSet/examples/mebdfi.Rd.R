library(deTestSet)


### Name: mebdfi
### Title: Solver for Differential Algebraic Equations (DAE) up to index 3
### Aliases: mebdfi
### Keywords: math

### ** Examples

## =======================================================================
## Coupled chemical reactions including an equilibrium
## modeled as (1) an ODE and (2) as a DAE
##
## The model describes three chemical species A,B,D:
## subjected to equilibrium reaction D <- > A + B
## D is produced at a constant rate, prod
## B is consumed at 1s-t order rate, r
## Chemical problem formulation 1: ODE
## =======================================================================

## Dissociation constant
K <- 1 

## parameters
pars <- c(
        ka   = 1e6,     # forward rate
        r    = 1,
        prod = 0.1)


Fun_ODE <- function (t, y, pars)
{
  with (as.list(c(y, pars)), {
    ra  <- ka*D        # forward rate
    rb  <- ka/K *A*B   # backward rate

    ## rates of changes
    dD  <- -ra + rb + prod
    dA  <-  ra - rb
    dB  <-  ra - rb - r*B
    return(list(dy = c(dA, dB, dD),
                CONC = A+B+D))
  })
}

## =======================================================================
## Chemical problem formulation 2: DAE
## 1. get rid of the fast reactions ra and rb by taking
## linear combinations   : dD+dA = prod (res1) and
##                         dB-dA = -r*B (res2)
## 2. In addition, the equilibrium condition (eq) reads:
## as ra = rb : ka*D = ka/K*A*B = >      K*D = A*B
## =======================================================================

Res_DAE <- function (t, y, yprime, pars)
{
  with (as.list(c(y, yprime, pars)), {
    ## residuals of lumped rates of changes
    res1 <- -dD - dA + prod
    res2 <- -dB + dA - r*B
    
    ## and the equilibrium equation
    eq   <- K*D - A*B

    return(list(c(res1, res2, eq),
                CONC = A+B+D))
  })
}

times <- seq(0, 100, by = 1)

## Initial conc; D is in equilibrium with A,B
y     <- c(A = 2, B = 3, D = 2*3/K)

## ODE model solved with mebdfi
ODE <- as.data.frame(mebdfi(y = y, times = times, func = Fun_ODE,
                     parms = pars, atol = 1e-8, rtol = 1e-8))

## Initial rate of change
dy  <- c(dA = 0, dB = 0, dD = 0) 
## DAE model solved with mebdfi
DAE <- as.data.frame(mebdfi(y = y, dy = dy, times = times,  
         res = Res_DAE, parms = pars, atol = 1e-8, rtol = 1e-8))

         
## =======================================================================
## Chemical problem formulation 3: Mass * Func
## Based on the DAE formulation
## =======================================================================

Mass_FUN <- function (t, y, pars)
{
  with (as.list(c(y, pars)), {

    ## as above, but without the 
    f1 <- prod
    f2 <- - r*B
    
    ## and the equilibrium equation
    f3   <- K*D - A*B

    return(list(c(f1, f2, f3),
                CONC = A+B+D))
  })
}
Mass <- matrix(nr=3, nc=3, byrow = TRUE, 
  data=c(1,  0, 1,         # dA + 0 + dB
        -1,  1, 0,         # -dA + dB +0
         0,  0, 0))        # algebraic
         
times <- seq(0, 100, by = 2)

## Initial conc; D is in equilibrium with A,B
y     <- c(A = 2, B = 3, D = 2*3/K)

## ODE model solved with daspk
ODE <- as.data.frame(daspk(y = y, times = times, func = Fun_ODE,
                     parms = pars, atol = 1e-10, rtol = 1e-10))

## Initial rate of change
dy  <- c(dA = 0, dB = 0, dD = 0) 

## DAE model solved with daspk
DAE <- as.data.frame(daspk(y = y, dy = dy, times = times,
         res = Res_DAE, parms = pars, atol = 1e-10, rtol = 1e-10))

MASS<- mebdfi(y = y, times = times, func = Mass_FUN, 
              parms = pars, mass = Mass)

## ================
## plotting output
## ================
opa <- par(mfrow = c(2, 2))

for (i in 2:5)
{
plot(ODE$time, ODE[, i], xlab = "time",
     ylab = "conc", main = names(ODE)[i], type = "l")
points(DAE$time, DAE[,i], col = "red")
}
legend("bottomright",lty = c(1,NA),pch = c(NA,1),
       col = c("black","red"),legend = c("ODE","DAE"))      
       
# difference between both implementations:
max(abs(ODE-DAE))

par(mfrow = opa)

## =============================================================================
##
## Example 3: higher index DAE
##
## Car axis problem, index 3 DAE, 8 differential, 2 algebraic equations
## from
## F. Mazzia and C. Magherini. Test Set for Initial Value Problem Solvers,
## release 2.4. Department
## of Mathematics, University of Bari and INdAM, Research Unit of Bari,
## February 2008.
## Available at http://www.dm.uniba.it/~testset.
## =============================================================================

# car returns the residuals of the implicit DAE
car <- function(t, y, dy, pars){
  with(as.list(c(pars, y)), {
      f <- rep(0, 10)

      yb  <- r*sin(w*t)
      xb  <- sqrt(L*L - yb*yb)
      Ll  <- sqrt(xl^2 + yl^2)
      Lr  <- sqrt((xr-xb)^2 + (yr-yb)^2)

      f[1:4] <- y[5:8]
      k <- M*eps*eps/2

      f[5]  <- (L0-Ll)*xl/Ll + lam1*xb+2*lam2*(xl-xr)
      f[6]  <- (L0-Ll)*yl/Ll + lam1*yb+2*lam2*(yl-yr)-k*g
      f[7]  <- (L0-Lr)*(xr-xb)/Lr - 2*lam2*(xl-xr)
      f[8]  <- (L0-Lr)*(yr-yb)/Lr - 2*lam2*(yl-yr)-k*g

      f[9]  <- xb*xl+yb*yl
      f[10] <- (xl-xr)^2+(yl-yr)^2-L*L

      delt       <- dy-f
      delt[5:8]  <- k*dy[5:8]-f[5:8]
      delt[9:10] <- -f[9:10]

      list(delt=delt,f=f)
  })
}


# parameters
pars <- c(eps = 1e-2, M = 10, L = 1, L0 = 0.5,
          r   = 0.1,  w = 10, g = 1)

# initial conditions: state variables
yini <-  with (as.list(pars),
   c(xl = 0, yl = L0, xr = L, yr = L0, xla = -L0/L,
     yla = 0, xra = -L0/L, yra = 0, lam1 = 0, lam2 = 0)
              )

# initial conditions: derivates
dyini <- rep(0, 10)
FF    <- car(0, yini, dyini, pars)
dyini[1:4] <- yini[5:8]
dyini[5:8] <- 2/pars["M"]/(pars["eps"])^2*FF$f[5:8]

# check consistency of initial condition: delt should be = 0.
car(0, yini, dyini, pars)

# running the model
times <- seq(0, 3, by = 0.01)
nind  <- c(4, 4, 2)   # index 1, 2 and 3 variables
out   <- mebdfi(y = yini, dy = dyini, times, res = car, parms = pars,
                nind = nind, rtol = 1e-5, atol = 1e-5)

plot(out, which = 1:4, type = "l", lwd=2)

mtext(outer = TRUE, side = 3, line = -0.5, cex = 1.5, "car axis")



