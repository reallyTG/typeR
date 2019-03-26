library(asremlPlus)


### Name: as.asrtests
### Title: Forms an asrtests object that stores (i) a fitted asreml object,
###   (ii) a pseudo-anova table for the fixed terms and (iii) a history of
###   changes and hypthesis testing used in obtaining the model.
### Aliases: as.asrtests asrtests
### Keywords: asreml htest

### ** Examples
## Not run: 
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
##D # Check for and remove any boundary terms
##D current.asrt <- rmboundary(current.asrt)
## End(Not run)


