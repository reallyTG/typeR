library(OOR)


### Name: StoSOO
### Title: StoSOO and SOO algorithms
### Aliases: StoSOO

### ** Examples

#------------------------------------------------------------
# Example 1 : Deterministic optimization with SOO
#------------------------------------------------------------
## Define objective
fun1 <- function(x) return(-guirland(x))

## Optimization
Sol1 <- StoSOO(par = NA, fn = fun1, nb_iter = 1000, control = list(type = "det", verbose = 1))

## Display objective function and solution found
curve(fun1, n = 1001)
abline(v = Sol1$par, col = 'red')

#------------------------------------------------------------
# Example 2 : Stochastic optimization with StoSOO
#------------------------------------------------------------
set.seed(42)

## Same objective function with uniform noise
fun2 <- function(x){return(fun1(x) + runif(1, min = -0.1, max = 0.1))}

## Optimization
Sol2 <- StoSOO(par = NA, fn = fun2, nb_iter = 1000, control = list(type = "sto", verbose = 1))

## Display solution
abline(v = Sol2$par, col = 'blue')

#------------------------------------------------------------
# Example 3 : Stochastic optimization with StoSOO, 2-dimensional function
#------------------------------------------------------------

set.seed(42)

## 2-dimensional noisy objective function, defined on [0, pi/4]^2
fun3 <- function(x){return(-sin1(x[1]) * sin1(1 - x[2]) + runif(1, min = -0.05, max = 0.05))}

## Optimizing
Sol3 <- StoSOO(par = rep(NA, 2), fn = fun3, upper = rep(pi/4, 2), nb_iter = 1000)

## Display solution
xgrid <- seq(0, pi/4, length.out = 101)
Xgrid <- expand.grid(xgrid, xgrid)
ref <- apply(Xgrid, 1, function(x){(-sin1(x[1]) * sin1(1 - x[2]))})
filled.contour(xgrid, xgrid, matrix(ref, 101), color.palette  = terrain.colors,
plot.axes = {axis(1); axis(2); points(Xgrid[which.min(ref),, drop = FALSE], pch = 21);
             points(Sol3$par[1],Sol3$par[2], pch = 13)})





