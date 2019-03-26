library(asremlPlus)


### Name: estimateV.asreml
### Title: Forms the estimated variance, random or residual matrix for the
###   observations from the variance parameter estimates.
### Aliases: estimateV.asreml estimateV
### Keywords: hplot dplot asreml

### ** Examples
## Not run: 
##D data(Wheat.dat)
##D current.asr <- asreml(yield ~ Rep + WithinColPairs + Variety, 
##D                       random = ~ Row + Column + units,
##D                       residual = ~ ar1(Row):ar1(Column), 
##D                       data=Wheat.dat)
##D # Form variance matrix based on estimated variance parameters
##D V <- estimateV(current.asr)
##D 
## End(Not run)


