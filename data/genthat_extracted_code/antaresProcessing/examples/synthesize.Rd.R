library(antaresProcessing)


### Name: synthesize
### Title: Synthesize Monte-Carlo scenarios
### Aliases: synthesize

### ** Examples

## Not run: 
##D mydata <- readAntares("all", timeStep = "annual")
##D 
##D synthesize(mydata)
##D 
##D # Add minimum and maximum for all variables
##D synthesize(mydata, "min", "max")
##D 
##D # Compute a custom statistic for all columns
##D synthesize(mydata, log = function(x) mean(log(1 + x)))
##D 
##D # Same but only for column "LOAD"
##D synthesize(mydata,
##D            log = list(fun = function(x) mean(log(1 + x)),
##D                       only = "LOAD"))
##D 
##D # Compute the proportion of time balance is positive
##D 
##D synthesize(mydata, propPos = list(fun = function(x) mean(x > 0),
##D                                   only = "BALANCE"))
##D 
##D # Compute 95% confidence interval for the marginal price
##D synthesize(mydata,
##D            l = list(fun = "q2.5", only = "MRG. PRICE"),
##D            u = list(fun = "q97.5", only = "MRG. PRICE"))
## End(Not run)




