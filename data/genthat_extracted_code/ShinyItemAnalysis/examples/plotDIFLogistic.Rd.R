library(ShinyItemAnalysis)


### Name: plotDIFLogistic
### Title: Function for characteristic curve of 2PL logistic DIF model
### Aliases: plotDIFLogistic

### ** Examples

## Not run: 
##D # loading libraries
##D library(difNLR, difR)
##D 
##D  # loading data based on GMAT
##D data(GMAT, package = "difNLR")
##D data  <- GMAT[, 1:20]
##D group <- GMAT[, 21]
##D 
##D # Characteristic curve by logistic regression model
##D plotDIFLogistic(data, group, item = 1)
##D 
##D # Characteristic curve by logistic regression model using scaled score
##D plotDIFLogistic(data, group, item = 1, IRT = T)
## End(Not run)





