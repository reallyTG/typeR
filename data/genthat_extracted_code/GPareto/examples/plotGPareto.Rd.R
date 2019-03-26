library(GPareto)


### Name: plotGPareto
### Title: Plot multi-objective optimization results and post-processing
### Aliases: plotGPareto

### ** Examples

## Not run: 
##D #---------------------------------------------------------------------------
##D # 2D objective function
##D #---------------------------------------------------------------------------
##D set.seed(25468)
##D n_var <- 2 
##D fname <- P1
##D lower <- rep(0, n_var)
##D upper <- rep(1, n_var)
##D res <- easyGParetoptim(fn=fname, lower=lower, upper=upper, budget=15, 
##D control=list(method="EHI", inneroptim="pso", maxit=20))
##D 
##D ## Pareto front only
##D plotGPareto(res)
##D 
##D ## With post-processing
##D plotGPareto(res, UQ_PF = TRUE, UQ_PS = TRUE, UQ_dens = TRUE)
##D 
##D ## With noise
##D noise.var <- c(10, 2)
##D funnoise <- function(x) {P1(x) + sqrt(noise.var)*rnorm(n=2)}
##D res2 <- easyGParetoptim(fn=funnoise, lower=lower, upper=upper, budget=15, noise.var=noise.var,
##D                        control=list(method="EHI", inneroptim="pso", maxit=20))
##D                        
##D plotGPareto(res2, control=list(add_denoised_PF=FALSE)) # noisy observations only
##D plotGPareto(res2)
##D 
##D #---------------------------------------------------------------------------
##D # 3D objective function
##D #---------------------------------------------------------------------------
##D set.seed(1)
##D n_var <- 3 
##D fname <- DTLZ1
##D lower <- rep(0, n_var)
##D upper <- rep(1, n_var)
##D res3 <- easyGParetoptim(fn=fname, lower=lower, upper=upper, budget=50, 
##D control=list(method="EHI", inneroptim="pso", maxit=20))
##D 
##D ## Pareto front only
##D plotGPareto(res3)
##D 
##D ## With noise
##D noise.var <- c(10, 2, 5)
##D funnoise <- function(x) {fname(x) + sqrt(noise.var)*rnorm(n=3)}
##D res4 <- easyGParetoptim(fn=funnoise, lower=lower, upper=upper, budget=100, noise.var=noise.var,
##D                        control=list(method="EHI", inneroptim="pso", maxit=20))
##D                        
##D plotGPareto(res4, control=list(add_denoised_PF=FALSE)) # noisy observations only
##D plotGPareto(res4)   
## End(Not run)



