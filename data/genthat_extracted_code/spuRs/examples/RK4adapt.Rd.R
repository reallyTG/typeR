library(spuRs)


### Name: RK4adapt
### Title: A function which uses the Fourth order Runge-Kutta method with
###   adaptive step size to solve a system of ODE's.
### Aliases: RK4adapt
### Keywords: Numerical solution of system of ODE's'

### ** Examples

LV <- function(t=NULL, y, a, b, g, e, K=Inf)
  c(a*y[1]*(1 - y[1]/K) - b*y[1]*y[2], g*b*y[1]*y[2] - e*y[2])

xy <- RK4adapt(LV, 0, c(100, 50), 200, 1, tol=1e-3, 
               a=0.05, K=Inf, b=0.0002, g=0.8, e=0.03)

par(mfrow = c(2,1))
plot(xy$y[,1], xy$y[,2], type='p', 
     xlab='prey', ylab='pred', main='RK4, adaptive h')
plot(xy$t, xy$y[,1], type='p', xlab='time', 
     ylab='prey circles pred triangles', main='RK4, adaptive h')
points(xy$t, xy$y[,2], pch=2)
par(mfrow=c(1,1))



