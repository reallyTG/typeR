library(plsdepot)


### Name: plsreg2
### Title: PLS-R2: Partial Least Squares Regression 2
### Aliases: plsreg2

### ** Examples

## Not run: 
##D  ## example of PLSR2 with the vehicles dataset
##D  data(vehicles)
##D 
##D  # apply plsreg2 extracting 2 components (no cross-validation)
##D  pls2_one = plsreg2(vehicles[,1:12], vehicles[,13:16], comps=2, crosval=FALSE)
##D 
##D  # apply plsreg2 with selection of components by cross-validation
##D  pls2_two = plsreg2(vehicles[,1:12], vehicles[,13:16], comps=NULL, crosval=TRUE)
##D 
##D  # apply plsreg2 extracting 5 components with cross-validation
##D  pls2_three = plsreg2(vehicles[,1:12], vehicles[,13:16], comps=5, crosval=TRUE)
##D 
##D  # plot variables
##D  plot(pls2_one)
##D  
## End(Not run)



