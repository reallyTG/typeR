library(plsVarSel)


### Name: filterPLSR
### Title: Optimisation of filters for Partial Least Squares
### Aliases: filterPLSR

### ** Examples

data(gasoline, package = "pls")
## Not run: 
##D with( gasoline, filterPLSR(octane, NIR, ncomp = 10, "minimum", validation = "LOO",
##D  RC.threshold = c(0.1,0.5), SR.threshold = 0.5))
## End(Not run)




