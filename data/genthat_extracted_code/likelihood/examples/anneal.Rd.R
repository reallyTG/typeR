library(likelihood)


### Name: anneal
### Title: Perform Simulated Annealing for Maximum Likelihood Estimation
### Aliases: anneal

### ** Examples

##
## Simulated annealing to maximize log
## likelihood for the following:
## Model: Radius = a + b * DBH
## Dataset: included crown_rad dataset
## We want to use simulated annealing to
## find maximum likelihood estimates of
## the parameters "a" and "b".
##
## Not run: 
##D library(likelihood)
##D 
##D ## Set up our dataset
##D data(crown_rad)
##D dataset <- crown_rad
##D 
##D ## Create our model function
##D modelfun <- function (a, b, DBH) {a + b * DBH}
##D 
##D ## Create the list for the parameters to estimate and
##D ## set initial values for a and b
##D par <- list(a = 0, b = 0)
##D 
##D ## Create a place to put all the other data needed by
##D ## the model and PDF, and indicate that DBH comes from 
##D ## the column marked "DBH" in the dataset
##D var <- list(DBH = "DBH")
##D 
##D ## Set bounds and initial search ranges within which to search for parameters
##D par_lo <- list(a = 0, b = 0)
##D par_hi <- list(a = 50, b = 50)
##D 
##D ## We'll use the normal probability density function -
##D ## add the options for it to our parameter list
##D ## "x" value in PDF is observed value
##D var$x <- "Radius"
##D 
##D ## Mean in normal PDF
##D var$mean <- "predicted"
##D var$sd <- 0.815585
##D 
##D ## Have it calculate log likelihood
##D var$log <- TRUE
##D 
##D results<-anneal(model = modelfun, par = par, var = var,
##D   source_data = dataset, par_lo = par_lo, par_hi = par_hi,
##D   pdf = dnorm, dep_var = "Radius", max_iter = 20000)
##D 
##D ## Alternately: reference crown_rad$DBH directly in the function without
##D ## using var
##D modelfun <- function (a, b) {a + b * crown_rad$DBH}
##D var <- list(x = "Radius",
##D             mean = "predicted",
##D             sd = 0.815585,
##D             log = TRUE)
##D results<-anneal(model = modelfun, par = par, var = var,
##D   source_data = dataset, par_lo = par_lo, par_hi = par_hi,
##D   pdf = dnorm, dep_var = "Radius", max_iter = 20000)  
## End(Not run)  



