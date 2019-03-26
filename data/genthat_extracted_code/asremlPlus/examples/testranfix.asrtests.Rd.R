library(asremlPlus)


### Name: testranfix.asrtests
### Title: Tests for a single fixed or random term in model fitted using
###   'asreml' and records the result in a data.frame.
### Aliases: testranfix.asrtests testranfix
### Keywords: asreml htest

### ** Examples
## Not run: 
##D data(Wheat.dat)
##D current.asr <- asreml(yield ~ Rep + WithinColPairs + Variety, 
##D                       random = ~ Row + Column + units,
##D                       residual = ~ ar1(Row):ar1(Column), 
##D                       data=Wheat.dat)
##D current.asrt <- asrtests(current.asr, NULL, NULL)
##D current.asrt <- rmboundary(current.asrt)
##D # Test nugget term
##D current.asrt <- testranfix(current.asrt, "units", positive=TRUE)
## End(Not run)


