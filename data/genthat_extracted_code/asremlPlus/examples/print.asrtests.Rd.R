library(asremlPlus)


### Name: print.asrtests
### Title: Prints the values in an 'asrtests.object'
### Aliases: print.asrtests
### Keywords: asreml htest

### ** Examples
## Not run: 
##D data(Wheat.dat)
##D current.asr <- asreml(yield ~ Rep + WithinColPairs + Variety, 
##D                       random = ~ Row + Column + units,
##D                       residual = ~ ar1(Row):ar1(Column), 
##D                       data=Wheat.dat)
##D current.asrt <- asrtests(current.asr, NULL, NULL)
##D current.asrt <- rmboundary.asrtests(current.asrt)
##D # Test Row autocorrelation
##D current.asrt <- testresidual(current.asrt, , "~ Row:ar1(Column)", 
##D                              label="Row autocorrelation", simpler=TRUE)
##D print(current.asrt)
## End(Not run)


