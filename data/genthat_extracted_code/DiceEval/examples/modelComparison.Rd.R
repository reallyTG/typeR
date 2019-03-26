library(DiceEval)


### Name: modelComparison
### Title: Comparison of different types of metamodels
### Aliases: modelComparison
### Keywords: models

### ** Examples

## Not run: 
##D data(dataIRSN5D)
##D X <- dataIRSN5D[,1:5]
##D Y <- dataIRSN5D[,6]
##D data(testIRSN5D)
##D library(gam)
##D library(mda)
##D library(polspline)
##D crit  <- modelComparison(X,Y, type="all",test=testIRSN5D)
##D 
##D crit2 <- modelComparison(X,Y, type=rep("StepLinear",5),test=testIRSN5D,
##D 		penalty=c(1,2,5,10,20),formula=Y~.^2)
##D     
## End(Not run)



