library(GPareto)


### Name: easyGParetoptim
### Title: EGO algorithm for multiobjective optimization
### Aliases: easyGParetoptim

### ** Examples

#---------------------------------------------------------------------------
# 2D objective function, 4 cases
#---------------------------------------------------------------------------
## Not run: 
##D set.seed(25468)
##D n_var <- 2 
##D fname <- ZDT3
##D lower <- rep(0, n_var)
##D upper <- rep(1, n_var)
##D 
##D #---------------------------------------------------------------------------
##D # 1- Expected Hypervolume Improvement optimization, using pso
##D #---------------------------------------------------------------------------
##D res <- easyGParetoptim(fn=fname, lower=lower, upper=upper, budget=15, 
##D                    control=list(method="EHI", inneroptim="pso", maxit=20))
##D par(mfrow=c(1,2))
##D plotGPareto(res)
##D title("Pareto Front")
##D plot(res$history$X, main="Pareto set", col = "red", pch = 20)
##D points(res$par, col="blue", pch = 17)
##D 
##D #---------------------------------------------------------------------------
##D # 2- SMS Improvement optimization using random search, with initial DOE given
##D #---------------------------------------------------------------------------
##D library(DiceDesign)
##D design.init   <- maximinESE_LHS(lhsDesign(10, n_var, seed = 42)$design)$design
##D response.init <- t(apply(design.init, 1, fname))
##D res <- easyGParetoptim(fn=fname, par=design.init, value=response.init, lower=lower, upper=upper, 
##D                        budget=15, control=list(method="SMS", inneroptim="random", maxit=100))
##D par(mfrow=c(1,2))
##D plotGPareto(res)
##D title("Pareto Front")
##D plot(res$history$X, main="Pareto set", col = "red", pch = 20)
##D points(res$par, col="blue", pch = 17)
##D 
##D #---------------------------------------------------------------------------
##D # 3- Stepwise Uncertainty Reduction optimization, with one fast objective function
##D #---------------------------------------------------------------------------
##D fname <- camelback
##D cheapfn <- function(x) {
##D if (is.null(dim(x))) return(-sum(x))
##D else return(-rowSums(x))
##D }
##D res <- easyGParetoptim(fn=fname, cheapfn=cheapfn, lower=lower, upper=upper, budget=15, 
##D                    control=list(method="SUR", inneroptim="pso", maxit=20))
##D par(mfrow=c(1,2))
##D plotGPareto(res)
##D title("Pareto Front")
##D plot(res$history$X, main="Pareto set", col = "red", pch = 20)
##D points(res$par, col="blue", pch = 17)
##D 
##D #---------------------------------------------------------------------------
##D # 4- Expected Hypervolume Improvement optimization, using pso, noisy fn
##D #---------------------------------------------------------------------------
##D noise.var <- c(0.1, 0.2)
##D funnoise <- function(x) {ZDT3(x) + sqrt(noise.var)*rnorm(n=2)}
##D res <- easyGParetoptim(fn=funnoise, lower=lower, upper=upper, budget=30, noise.var=noise.var,
##D                        control=list(method="EHI", inneroptim="pso", maxit=20))
##D par(mfrow=c(1,2))
##D plotGPareto(res)
##D title("Pareto Front")
##D plot(res$history$X, main="Pareto set", col = "red", pch = 20)
##D points(res$par, col="blue", pch = 17)
##D 
##D #---------------------------------------------------------------------------
##D # 5- Stepwise Uncertainty Reduction optimization, functional noise
##D #---------------------------------------------------------------------------
##D funnoise <- function(x) {ZDT3(x) + sqrt(abs(0.1*x))*rnorm(n=2)}
##D noise.var <- function(x) return(abs(0.1*x))
##D 
##D res <- easyGParetoptim(fn=funnoise, lower=lower, upper=upper, budget=30, noise.var=noise.var,
##D                      control=list(method="SUR", inneroptim="pso", maxit=20))
##D par(mfrow=c(1,2))
##D plotGPareto(res)
##D title("Pareto Front")
##D plot(res$history$X, main="Pareto set", col = "red", pch = 20)
##D points(res$par, col="blue", pch = 17)
## End(Not run)



