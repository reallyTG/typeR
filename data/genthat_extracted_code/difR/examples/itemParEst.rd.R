library(difR)


### Name: itemParEst
### Title: Item parameter estimation for DIF detection
### Aliases: itemParEst

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D 
##D  # Estimation of the item parameters (1PL model, "ltm" engine)
##D  items.1PL <- itemParEst(verbal[,1:24], model = "1PL")
##D 
##D  # Estimation of the item parameters (1PL model, "ltm" engine,
##D  # estimated common discrimination parameter)
##D  items.1PL <- itemParEst(verbal[,1:24], model = "1PL", discr = NULL)
##D 
##D  # Estimation of the item parameters (1PL model, "lme4" engine)
##D  items.1PL <- itemParEst(verbal[,1:24], model = "1PL", engine = "lme4")
##D 
##D  # Estimation of the item parameters (2PL model)
##D  items.2PL <- itemParEst(verbal[,1:24], model = "2PL")
##D 
##D  # Estimation of the item parameters (3PL model)
##D  # items.3PL <- itemParEst(verbal[,1:24], model = "3PL")
##D 
##D  # Constraining all pseudo-guessing values to be equal to 0.05
##D  items.3PLc <- itemParEst(verbal[,1:24], model = "3PL", c = 0.05)
## End(Not run)



