library(OOR)


### Name: OOR
### Title: Package OOR
### Aliases: OOR OOR-package

### ** Examples

#------------------------------------------------------------
# Example 1 : Deterministic optimization with SOO
#------------------------------------------------------------
## Define objective
fun1 <- function(x) return(-guirland(x))

## Optimization
Sol1 <- StoSOO(par = NA, fn = fun1, nb_iter = 1000, control = list(type = "det", verbose = 1))

## Display objective function and solution fund
curve(fun1, n = 1001)
abline(v = Sol1$par, col = 'red')

#------------------------------------------------------------
# Example 2 : Stochastic optimization with StoSOO
#------------------------------------------------------------
set.seed(42)

## 2-dimensional noisy objective function, defined on [0, pi/4]^2
fun2 <- function(x){return(-sin1(x[1]) * sin1(1 - x[2]) + runif(1, min = -0.05, max = 0.05))}

## Optimizing
Sol2 <- StoSOO(par = rep(NA, 2), fn = fun2, upper = rep(pi/4, 2), nb_iter = 1000)

## Display solution
xgrid <- seq(0, pi/4, length.out = 101)
Xgrid <- expand.grid(xgrid, xgrid)
ref <- apply(Xgrid, 1, function(x){(-sin1(x[1]) * sin1(1 - x[2]))})
filled.contour(xgrid, xgrid, matrix(ref, 101), color.palette  = terrain.colors,
plot.axes = {axis(1); axis(2); points(Xgrid[which.min(ref),, drop = FALSE], pch = 21);
             points(Sol2$par[1], Sol2$par[2], pch = 13)})

## Not run: 
##D #------------------------------------------------------------
##D # Example 3 : Stochastic optimization with POO
##D #------------------------------------------------------------
##D set.seed(10)
##D noise.level <- 0.05
##D 
##D ## Define and display objective
##D fun3 <- function(x){return(double_sine(x) + runif(1, min = -noise.level, max = noise.level))}
##D xgrid <- seq(0, 1, length.out = 1000)
##D plot(xgrid, sapply(xgrid, double_sine), type = 'l', ylab = "double_sine(x)", xlab = 'x')
##D 
##D ## Maximization
##D Sol3 <- POO(fun3, horizon = 1000, noise.level = noise.level)
##D 
##D ## Display result
##D abline(v = Sol3$par)
## End(Not run)



