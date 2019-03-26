library(EpiILM)


### Name: epilike
### Title: Calculates the log likelihood
### Aliases: epilike

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
##D epilike(type = "SI", x = x, y = y, inftime = out$inftime, tmax = 15, 
##D          alpha = c(0.1, 0.3), beta = 5, Sformula = ~covariate)
## End(Not run)
## Example 2: spatial SIR model 
# generate infectious period (=3) for 100 individuals 
## Not run: 
##D lambda <- rep(3, 100)
##D 
##D out <- epidata(type = "SIR", n = 100, tmax = 15, alpha  =0.3, beta = 5.0,
##D               infperiod = lambda, x = x, y = y)
##D 
##D epilike(type = "SIR", x = x, y = y, infperiod = lambda, inftime = out$inftime, 
##D         tmax = 15, alpha = 0.3, beta = 5.0)
##D 
## End(Not run)



