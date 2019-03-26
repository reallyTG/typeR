library(plsdepot)


### Name: plsreg1
### Title: PLS-R1: Partial Least Squares Regression 1
### Aliases: plsreg1

### ** Examples

## Not run: 
##D  ## example of PLSR1 with the vehicles dataset
##D  # predictand variable: price of vehicles
##D  data(vehicles)
##D 
##D  # apply plsreg1 extracting 2 components (no cross-validation)
##D  pls1_one = plsreg1(vehicles[,1:12], vehicles[,13,drop=FALSE], comps=2, crosval=FALSE)
##D 
##D  # apply plsreg1 with selection of components by cross-validation
##D  pls1_two = plsreg1(vehicles[,1:12], vehicles[,13,drop=FALSE], comps=NULL, crosval=TRUE)
##D 
##D  # apply plsreg1 extracting 5 components with cross-validation
##D  pls1_three = plsreg1(vehicles[,1:12], vehicles[,13,drop=FALSE], comps=5, crosval=TRUE)
##D 
##D  # plot variables
##D  plot(pls1_one)
##D  
## End(Not run)



