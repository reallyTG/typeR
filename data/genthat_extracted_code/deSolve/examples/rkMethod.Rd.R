library(deSolve)


### Name: rkMethod
### Title: Collection of Parameter Sets (Butcher Arrays) for the
###   Runge-Kutta Family of ODE Solvers
### Aliases: rkMethod
### Keywords: math

### ** Examples

rkMethod()          # returns the names of all available methods
rkMethod("rk45dp7") # parameters of the Dormand-Prince 5(4) method
rkMethod("ode45")   # an alias for the same method

func <- function(t, x, parms) {
  with(as.list(c(parms, x)),{
    dP  <- a * P      - b * C * P
    dC  <- b * P * C  - c * C
    res <- c(dP, dC)
    list(res)
  })
}
times  <- seq(0, 200, length = 101)
parms  <- c(a = 0.1, b = 0.1, c = 0.1)
x <- c(P = 2, C = 1)

## rk using ode45 as the default method
out <- rk(x, times, func, parms)

## all methods can be called also from 'ode' by using rkMethod
out <- ode(x, times, func, parms, method = rkMethod("rk4"))

## 'ode' has aliases for the most common RK methods
out <- ode(x, times, func, parms, method = "ode45")

##===========================================================================
## Comparison of local error from different interpolation methods
##===========================================================================

## lsoda with lower tolerances (1e-10) used as reference
o0 <- ode(x, times, func, parms, method = "lsoda", atol = 1e-10, rtol = 1e-10)

## rk45dp7 with hmax = 10 > delta_t  = 2
o1 <- ode(x, times, func, parms, method = rkMethod("rk45dp7"), hmax = 10)

## disable dense-output interpolation
## and use only Neville-Aitken polynomials instead
o2 <- ode(x, times, func, parms,
  method = rkMethod("rk45dp7", densetype = NULL, nknots = 5), hmax = 10)

## stop and go: disable interpolation completely
## and integrate explicitly between external time steps
o3 <- ode(x, times, func, parms,
  method = rkMethod("rk45dp7", densetype = NULL, nknots = 0, hmax=10))

## compare different interpolation methods with lsoda
mf <- par("mfrow" = c(4, 1))
matplot(o1[,1], o1[,-1], type = "l", xlab = "Time", main = "State Variables",
  ylab = "P, C")
matplot(o0[,1], o0[,-1] - o1[,-1], type = "l", xlab = "Time", ylab = "Diff.",
  main="Difference between lsoda and ode45 with dense output")
abline(h = 0, col = "grey")
matplot(o0[,1], o0[,-1] - o2[,-1], type = "l", xlab = "Time", ylab = "Diff.",
  main="Difference between lsoda and ode45 with Neville-Aitken")
abline(h = 0, col = "grey")
matplot(o0[,1], o0[,-1] - o3[,-1], type = "l", xlab = "Time", ylab = "Diff.",
  main="Difference between lsoda and ode45 in 'stop and go' mode")
abline(h = 0, col = "grey")
par(mf)

##===========================================================================
## rkMethod allows to define user-specified Runge-Kutta methods
##===========================================================================
out <- ode(x, times, func, parms,
          method = rkMethod(ID = "midpoint",
            varstep = FALSE,
            A      = c(0, 1/2),
            b1      = c(0, 1),
            c       = c(0, 1/2),
            stage   = 2,
            Qerr    = 1
          )
        )
plot(out)

## compare method diagnostics
times  <- seq(0, 200, length = 10)
o1 <- ode(x, times, func, parms, method = rkMethod("rk45ck"))
o2 <- ode(x, times, func, parms, method = rkMethod("rk78dp"))
diagnostics(o1)
diagnostics(o2)




