library(asremlPlus)


### Name: is.asrtests
### Title: Tests whether an object is of class asrtests
### Aliases: is.asrtests
### Keywords: manip

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
##D # check the class of current.asrt
##D is.asrtests(current.asrt)
## End(Not run)


