library(asremlPlus)


### Name: validAsrtests
### Title: Checks that an object is a valid asrtests object.
### Aliases: validAsrtests
### Keywords: asreml htest

### ** Examples
## Not run: 
##D library(dae)
##D library(asreml)
##D library(asremlPlus)
##D ## use ?Wheat.dat for data set details
##D data(Wheat.dat)
##D 
##D # Fit initial model
##D current.asr <- asreml(yield ~ Rep + WithinColPairs + Variety, 
##D                       random = ~ Row + Column + units,
##D                       residual = ~ ar1(Row):ar1(Column), 
##D                       data=Wheat.dat)
##D 
##D # Load current fit into an asrtests object
##D current.asrt <- asrtests(current.asr, NULL, NULL)
##D 
##D # check validity of current.asrt
##D validAsrtests(current.asrt)
## End(Not run)


