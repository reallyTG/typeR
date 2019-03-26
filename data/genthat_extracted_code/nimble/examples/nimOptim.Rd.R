library(nimble)


### Name: nimOptim
### Title: Nimble wrapper around R's builtin 'optim'.
### Aliases: nimOptim

### ** Examples

## Not run: 
##D objectiveFunction <- nimbleFunction(
##D     run = function(par = double(1)) {
##D         return(sum(par) * exp(-sum(par ^ 2) / 2))
##D         returnType(double(0))
##D     }
##D )
##D optimizer <- nimbleFunction(
##D     run = function(method = character(0), fnscale = double(0)) {
##D         control <- optimDefaultControl()
##D         control$fnscale <- fnscale
##D         par <- c(0.1, -0.1)
##D         return(optim(par, objectiveFunction, method = method, control = control))
##D         returnType(optimResultNimbleList())
##D     }
##D )
##D cOptimizer <- compileNimble(optimizer)
##D cOptimizer(method = 'BFGS', fnscale = -1)
## End(Not run)



