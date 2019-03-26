library(stepPenal)


### Name: lassomodel
### Title: Fits a lasso model and a lasso followed by a stepAIC algorithm.
### Aliases: lassomodel

### ** Examples

## Not run: 
##D set.seed(14)
##D beta    <- c(3, 2, -1.6, -4)
##D noise   <- 5
##D simData <- SimData(N=100, beta=beta, noise=noise, corr=FALSE)
##D 
##D lassofit <- lassomodel(Data=simData, measure="auc")
##D lassofit
##D 
##D lassofit2 <- lassomodel(Data=simData, measure="deviance")
##D lassofit2
## End(Not run)




