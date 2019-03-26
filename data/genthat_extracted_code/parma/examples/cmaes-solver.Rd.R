library(parma)


### Name: cmaes
### Title: The Covariance Matrix Adaptation Evolution Strategy (cmaes)
###   Solver
### Aliases: cmaes cmaes.control

### ** Examples

## Not run: 
##D ctrl = cmaes.control()
##D ctrl$options$StopOnWarnings = FALSE
##D ctrl$cma$active = 1
##D ctrl$options$TolFun = 1e-12
##D ctrl$options$DispModulo=100
##D ctrl$options$Restarts = 0
##D ctrl$options$MaxIter = 3000
##D ctrl$options$TolUpX = 5
##D ctrl$options$PopSize = 300
##D test1 = cmaes(rnorm(10), fun = parma:::fsphere, 
##D lower = -Inf, upper = Inf, insigma = 1, ctrl = ctrl)
##D test2 = cmaes(rnorm(10), fun = parma:::frosenbrock, 
##D lower = -Inf, upper = Inf, insigma = 1, ctrl = ctrl)
##D 
##D ctrl = cmaes.control()
##D ctrl$options$StopOnWarnings = FALSE
##D ctrl$cma$active = 1
##D ctrl$options$TolFun = 1e-12
##D ctrl$options$DispModulo=100
##D ctrl$options$Restarts = 0
##D ctrl$options$MaxIter = 3000
##D ctrl$options$PopSize = 400
##D test3 = cmaes(rep(1, 10), fun = parma:::frastrigin10, 
##D lower = -50, upper = 50, insigma = 1, ctrl = ctrl)
## End(Not run)


