library(EpiILM)


### Name: epidata
### Title: Simulates epidemic for the specified model type and parameters
### Aliases: epidata

### ** Examples



## Example 1:  spatial SI model 
# generate 100 individuals

x <- runif(100, 0, 10)

y <- runif(100, 0, 10)

covariate <- runif(100, 0, 2)

out <- epidata(type = "SI",n = 100, Sformula = ~covariate, tmax = 15, 
               alpha = c(0.1, 0.3), beta = 5.0, x = x, y = y)

# Plots of epidemic progression (optional)

epispatial(type = "SI", x = x, y = y, inftime = out$inftime)

epicurve(type = "SI", inftime = out$inftime, plottype = "newinfect")

## Example 2: spatial SIR model 
# generate infectious period(=3) for 100 individuals 

lambda <- rep(3, 100)

epidata(type = "SIR", n = 100, tmax = 15, alpha = 0.3, beta = 5.0, infperiod = lambda, 
        x = x, y = y)

## Example 3:   SI network model 
## Not run: 
##D contact1 <- matrix(rbinom(10000, 1, 0.1), nrow = 100, ncol = 100)
##D 
##D contact2 <- matrix(rbinom(10000, 1, 0.1), nrow = 100, ncol = 100)
##D 
##D diag(contact1[,] ) <- 0
##D 
##D diag(contact2[,] ) <- 0
##D 
##D contact <- array(c(contact1, contact2), dim = c(100, 100, 2))
##D 
##D epidata(type = "SI", n = 100, tmax = 15, alpha = 0.3, beta = c(3.0, 5.0), 
##D         contact = contact)
##D 
## End(Not run)



