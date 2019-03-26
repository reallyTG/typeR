library(EpiILM)


### Name: epimcmc
### Title: Monte Carlo Simulation
### Aliases: epimcmc

### ** Examples



## Example 1:  spatial SI model 
# generate 100 individuals
## Not run: 
##D x <- runif(100, 0, 10)
##D 
##D y <- runif(100, 0, 10)
##D 
##D covariate <- runif(100, 0, 2)
##D 
##D out <- epidata(type = "SI", n = 100, Sformula = ~covariate, tmax = 15, 
##D               alpha = c(0.1, 0.3), beta = 5.0, x = x, y = y)
##D 
##D 
##D mcout <- epimcmc(type = "SI", x = x, y = y, inftime = out$inftime, Sformula = ~covariate, 
##D                 tmax = 15, niter = 1000, alphaini = c(0.01, 0.01), betaini = 0.01,
##D                 pro.var.a = c(0.01, 0.005), pro.var.b = 0.05, 
##D                 prioralpha = "halfnormal", halfnorm.var.a = c(10**5, 10**5), 
##D                 priorbeta = "halfnormal", halfnorm.var.b = 10**5)
## End(Not run)



