library(ShinyItemAnalysis)


### Name: plotDIFirt
### Title: Function for characteristic curve of DIF IRT model
### Aliases: plotDIFirt

### ** Examples

## Not run: 
##D # loading libraries
##D library(difR)
##D library(ltm)
##D 
##D  # loading data based on GMAT2
##D data(GMAT2, package = "difNLR")
##D 
##D # Estimation of 2PL IRT model and Lord's statistic
##D # by difR package
##D fitLord <- difLord(GMAT2, group = 21, focal.name = 1, model = "2PL")
##D # plot of item 1 and Lord's statistic
##D plotDIFirt(fitLord$itemParInit, item = 1)
##D 
##D # Estimation of 2PL IRT model and Raju's statistic
##D # by difR package
##D fitRaju <- difRaju(GMAT2, group = 21, focal.name = 1, model = "2PL")
##D # plot of item 1 and Lord's statistic
##D plotDIFirt(fitRaju$itemParInit, test = "Raju", item = 1)
## End(Not run)



