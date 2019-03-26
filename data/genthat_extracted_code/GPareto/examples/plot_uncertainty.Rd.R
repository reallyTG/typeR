library(GPareto)


### Name: plot_uncertainty
### Title: Plot uncertainty
### Aliases: plot_uncertainty

### ** Examples

## Not run: 
##D  
##D #---------------------------------------------------------------------------
##D # 2D, bi-objective function
##D #---------------------------------------------------------------------------
##D set.seed(25468)
##D n_var <- 2 
##D fname <- P1
##D lower <- rep(0, n_var)
##D upper <- rep(1, n_var)
##D res1 <- easyGParetoptim(fn=fname, lower=lower, upper=upper, budget=15, 
##D control=list(method="EHI", inneroptim="pso", maxit=20))
##D 
##D plot_uncertainty(res1$model, lower = lower, upper = upper)
##D 
##D #---------------------------------------------------------------------------
##D # 4D, bi-objective function
##D #---------------------------------------------------------------------------
##D set.seed(25468)
##D n_var <- 4
##D fname <- DTLZ2
##D lower <- rep(0, n_var)
##D upper <- rep(1, n_var)
##D res <- easyGParetoptim(fn=fname, lower=lower, upper=upper, budget = 40, 
##D control=list(method="EHI", inneroptim="pso", maxit=40))
##D 
##D plot_uncertainty(res$model, lower = lower, upper = upper, resolution = 31)
## End(Not run) 



