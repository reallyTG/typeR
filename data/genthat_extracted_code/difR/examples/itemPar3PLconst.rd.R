library(difR)


### Name: itemPar3PLconst
### Title: Item parameter estimation for DIF detection using constrained
###   3PL model
### Aliases: itemPar3PLconst

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D 
##D  # Constraining all pseudo-guessing parameters to be equal to 0.05
##D  itemPar3PLconst(verbal[,1:24], c = 0.05)
##D 
##D  # Constraining pseudo-guessing values to  0.1 for the first 10 items,
##D  # and to 0.05 for the remaining ones
##D  itemPar3PLconst(verbal[,1:24], c = c(rep(0.1, 10), rep(0.05, 14)))
##D  
## End(Not run)
 


