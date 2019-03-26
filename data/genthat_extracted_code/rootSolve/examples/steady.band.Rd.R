library(rootSolve)


### Name: steady.band
### Title: Steady-state solver for ordinary differential equations; assumes
###   a banded jacobian
### Aliases: steady.band
### Keywords: math

### ** Examples

## =======================================================================
## 1000 simultaneous equations, solved 6 times for different 
## values of parameter "decay"
## =======================================================================

model <- function (time, OC, parms, decay)  {
  # model of particles (OC) that sink out of the water and decay
  # exponentially declining sinking rate, maximal 100 m/day
  sink <- 100 * exp(-0.01*dist)
  
  # boundary flux; upper boundary=imposed concentration (100)
  Flux <- sink * c(100 ,OC)     
   
  # Rate of change= Flux gradient and first-order consumption
  dOC  <- -diff(Flux)/dx - decay*OC
  list(dOC, maxC = max(OC))
}

dx   <- 1                          # thickness of boxes
dist <- seq(0, 1000, by = dx)      # water depth at each modeled box interface

ss   <- NULL 
for (decay in seq(from = 0.1, to = 1.1, by = 0.2))
  ss   <- cbind(ss, steady.band(runif(1000), func = model,
                parms = NULL, nspec = 1, decay = decay)$y)  

matplot(ss, 1:1000, type = "l", lwd = 2, main = "steady.band", 
  ylim=c(1000, 0), ylab = "water depth, m", 
  xlab = "concentration of sinking particles")

legend("bottomright", legend = seq(from = 0.1, to = 1.1, by = 0.2),
   lty = 1:10, title = "decay rate", col = 1:10, lwd = 2)

## =======================================================================
## 5001 simultaneous equations: solve
## dy/dt = 0 = d2y/dx2 + 1/x*dy/dx + (1-1/(4x^2)y - sqrx(x)*cos(x),
## over the interval [1,6], with boundary conditions: y(1)=1, y(6)=-0.5
## =======================================================================

derivs <- function(t, y, parms, x, dx, N, y1, y6)  {

  # Numerical approximation of derivates:
  # d2y/dx2 = (yi+1-2yi+yi-1)/dx^2
   d2y <- (c(y[-1],y6) -2*y + c(y1,y[-N])) /dx/dx

  # dy/dx = (yi+1-yi-1)/(2dx)
   dy  <- (c(y[-1],y6) - c(y1,y[-N])) /2/dx

   res <- d2y+dy/x+(1-1/(4*x*x))*y-sqrt(x)*cos(x)
   return(list(res))
}

dx     <- 0.001
x      <- seq(1,6,by=dx)
N      <- length(x)
y  <- steady.band(y = rep(1, N), time = 0, func = derivs, x = x, dx = dx,
                  N = N, y1 = 1, y6 = -0.5, nspec = 1)$y
plot(x, y, type = "l", main = "5001 nonlinear equations - banded Jacobian")

# add the analytic solution for comparison:
xx     <- seq(1, 6, by = 0.1)
ana <- 0.0588713*cos(xx)/sqrt(xx)+1/4*sqrt(xx)*cos(xx)+
       0.740071*sin(xx)/sqrt(xx)+1/4*xx^(3/2)*sin(xx)
points(xx, ana)
legend("topright", pch = c(NA, 1), lty = c(1, NA),
       c("numeric", "analytic"))




