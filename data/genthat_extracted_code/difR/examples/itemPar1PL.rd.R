library(difR)


### Name: itemPar1PL
### Title: Item parameter estimation for DIF detection using Rasch (1PL)
###   model
### Aliases: itemPar1PL

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D  
##D  # Getting item parameter estimates ('ltm' engine)
##D  itemPar1PL(verbal[, 1:24])
##D 
##D  # Estimating the common discrimination parameter instead
##D  itemPar1PL(verbal[, 1:24], discr = NULL)
##D 
##D  # Getting item parameter estimates ('lme4' engine) 
##D  itemPar1PL(verbal[, 1:24], engine = "lme4")
##D  
## End(Not run)
 


